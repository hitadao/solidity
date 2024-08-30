// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 引入代币合约需要继承的 openzeppelin 的 ERC-20 合约
import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol";

contract StableCoin is ERC20, Ownable {
    // 合约暂停功能。稳定币合约可以随时暂停，或者重启
    bool public paused;  // 是否暂停合约

    // 资产保护功能。稳定币合约可以冻结用户资产，并可以清空用户资产
    address public assetProtectionRole; // 资产保护者地址，它有权冻结用户账户
    mapping(address => bool) frozen; // 保存用户账户是否冻结

    // 供应控制功能。稳定币合约可以增发或者销毁代币
    address public supplyController; // 供应控制地址。它有权增发或者销毁代币

    event Pause(); // 合约暂停事件
    event Unpause(); // 合约重启事件

    event AddressFrozen(address indexed addr); // 资产冻结事件
    event AddressUnfrozen(address indexed addr); // 资产解冻事件
    event FrozenAddressWiped(address indexed addr); // 资产清空事件
    // 更换资产管理者地址事件
    event AssetProtectionRoleSet (
        address indexed oldAssetProtectionRole,
        address indexed newAssetProtectionRole
    );

    // 增加代币供应量事件
    event SupplyIncreased(address indexed to, uint256 value);
    // 减少代币供应量事件
    event SupplyDecreased(address indexed from, uint256 value);
    // 更换供应控制器事件
    event SupplyControllerSet(
        address indexed oldSupplyController,
        address indexed newSupplyController
    );

    // 构造函数
    constructor() ERC20("Tether USD", "USDT") {
        // 将部署合约的账户设置为初始的资产保护角色
        assetProtectionRole = msg.sender;
        // 将部署合约的账户设置为初始的供应控制器
        supplyController = msg.sender;
        // 初始状态为未暂停
        paused = false;
    }

    // ERC-20 基本功能
    // 稳定币的小数位数通常为6，而 Openzeppelin ERC-20 合约默认为18
    function decimals() public pure override returns (uint8) {
        return 6;
    }
    // 从 msg.sender 向指定地址转移代币
    function transfer(address _to, uint256 _value) 
        public override whenNotPaused returns (bool) {
        // 确保目标地址和当前地址均未被冻结，否则抛出异常信息
        require(!frozen[_to] && !frozen[msg.sender], "address frozen");
        // 调用父合约的 transfer 函数来执行代币转移
        return super.transfer(_to, _value);
    }
    // 从一个地址向另一个地址转移代币
    function transferFrom(address _from,address _to,uint256 _value)
        public override whenNotPaused returns (bool) {
        // 确保目标地址、源地址和当前地址均未被冻结，否则抛出异常信息
        require(!frozen[_to] && !frozen[_from] && !frozen[msg.sender], 
            "address frozen");
        // 调用父合约的 transferFrom 函数来执行代币转移
        return super.transferFrom(_from, _to, _value);
    }
    // 收回合约地址上的所有代币。这不受冻结限制影响
    function reclaim() external onlyOwner {
        // 获取合约余额
        uint256 balance = balanceOf(address(this));
        // 将余额转移到拥有者地址
        _transfer(address(this), supplyController, balance);
    }

    // 暂停功能
    // 合约启停修饰符，限制仅在合约未停时可调用函数。
    modifier whenNotPaused() {
        // 确保合约未暂停，否则抛出异常信息
        require(!paused, "whenNotPaused");
        // 继续执行被修饰的函数
        _;
    }
    // 由合约拥有者调用以暂停，触发已停止状态
        // 确保合约未暂停，否则抛出异常信息
    function pause() public onlyOwner {
        require(!paused, "already paused");
        // 设置合约为暂停状态
        paused = true;
        // 发出合约暂停事件
        emit Pause();
    }
    // 由合约拥有者调用以解除暂停，恢复正常状态
    function unpause() public onlyOwner {
        // 确保合约已暂停，否则抛出异常信息
        require(paused, "already unpaused");
        // 设置合约为未暂停状态
        paused = false;
        // 发出合约重启事件
        emit Unpause();
    }

    // 资产保护功能
    // 设置新的资产保护角色地址，它可以冻结/解冻地址，清空资产
    function setAssetProtectionRole(address _newAssetProtectionRole) public {
        // 确保只有资产保护角色地址或合约拥有者可以调用该函数，否则抛出异常信息
        require(msg.sender == assetProtectionRole || msg.sender == owner(), 
            "only assetProtectionRole or Owner");
        // 确保新的资产保护角色地址不同于当前的地址，否则抛出异常信息
        require(assetProtectionRole != _newAssetProtectionRole, 
               "new address is same as a current one");
        // 发出资产保护角色变更事件，记录旧的和新的资产保护角色地址
        emit AssetProtectionRoleSet(assetProtectionRole, _newAssetProtectionRole);
        // 更新资产保护角色地址为新的地址
        assetProtectionRole = _newAssetProtectionRole;
    }
    // 资产保护角色修饰符，限制只能由资产保护角色调用
    modifier onlyAssetProtectionRole() {
        // 确保只有资产保护角色地址可以调用该函数，否则抛出异常信息
        require(msg.sender == assetProtectionRole, "only AssetProtectionRole");
        // 继续执行被修饰的函数
        _;
    }
    // 冻结地址的余额，阻止转移
    function freeze(address  _addr) public onlyAssetProtectionRole {
        // 确保地址未被冻结，否则抛出异常信息
        require(!frozen[_addr], "address already frozen");
        // 设置地址的冻结状态为已冻结
        frozen[_addr] = true;
        // 发出地址冻结事件
        emit AddressFrozen(_addr);
    }
    // 解冻地址的余额，允许转移
    function unfreeze(address _addr) public onlyAssetProtectionRole {
        // 确保地址已被冻结，否则抛出异常信息
        require(frozen[_addr], "address already unfrozen");
        // 设置地址的冻结状态为未冻结
        frozen[_addr] = false;
        // 发出地址解冻事件
        emit AddressUnfrozen(_addr);
    }
    // 清空冻结地址的余额，并销毁代币
    function wipeFrozenAddress(address _addr) public onlyAssetProtectionRole {
        // 确保地址被冻结，否则抛出异常信息
        require(frozen[_addr], "address is not frozen");
        // 获取地址的余额
        uint balance =  balanceOf(_addr);
        // 销毁地址的余额
        _burn(_addr, balance);
        // 发出冻结地址被清空的事件
        emit FrozenAddressWiped(_addr);
        // 发出供应量减少事件，记录减少的数量和操作者
        emit SupplyDecreased(_addr, balance);
    }
    // 查询地址是否被冻结
    function isFrozen(address _addr) public view returns (bool) {
        // 获取地址的冻结状态
        return frozen[_addr];
    }

    // 供应控制功能
    // 设置新的供应控制器地址
    function setSupplyController(address _newSupplyController) public {
        // 确保只有供应控制器地址或合约拥有者可以调用该函数，否则抛出异常信息
        require(msg.sender == supplyController || msg.sender == owner(), 
            "only SupplyController or Owner");
        // 确保新的供应控制器地址不为零地址，否则抛出异常信息
        require(_newSupplyController != address(0), 
            "cannot set supply controller to address zero");
        // 确保新的供应控制器地址不同于当前的供应控制器地址，否则抛出异常信息
        require(supplyController != _newSupplyController, 
            "new address is same as a current one");
        // 发出供应控制器地址变更事件，记录旧的和新的供应控制器地址
        emit SupplyControllerSet(supplyController, _newSupplyController);
        // 更新供应控制器地址为新的地址
        supplyController = _newSupplyController;
    }
    // 供应控制器修饰符，用于限制只能由供应控制器调用
    modifier onlySupplyController() {
        // 确保只有供应控制器地址可以调用该函数，否则抛出异常信息
        require(msg.sender == supplyController, "onlySupplyController");
        // 继续执行被修饰的函数
        _;
    }
    // 铸造指定数量的代币来增加总供应量，铸造到供应控制器账户
    function increaseSupply(uint256 _value) 
        public onlySupplyController returns (bool success) {
       // 调用增发指定数量的代币到供应控制账户
        _mint(supplyController, _value);
        // 发出供应量增加事件，记录增加的数量和操作者
        emit SupplyIncreased(supplyController, _value);
        // 返回操作成功
        return true;
    }
    // 通过从供应控制器账户销毁指定数量的代币，来减少总供应量
    function decreaseSupply(uint256 _value) 
        public onlySupplyController returns (bool success) {
        // 确保减少的数量不超过供应控制账户的代币余额
        require(_value <= balanceOf(supplyController), "not enough supply");
        // 从供应控制账户中销毁指定数量的代币
        _burn(supplyController, _value);
        // 发出供应量减少事件，记录减少的数量和操作者
        emit SupplyDecreased(supplyController, _value);
        // 返回操作成功
        return true;
    }
}