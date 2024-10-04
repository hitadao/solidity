const { ethers } = require('ethers'); //"ethers": "^5.7.1"

// 使用 Infura 免费 RPC 节点
const provider = new ethers.providers.JsonRpcProvider('https://mainnet.infura.io/v3/<Your infura API key>');

// 发送交易的钱包私钥
const privateKey = '<Your private key>'; 
const wallet = new ethers.Wallet(privateKey, provider);

async function sendMessageToETH() {
    // 获取交易计数 nonce
    const nonce = await provider.getTransactionCount(wallet.address);

    // 构建交易
    const tx = {
        nonce: ethers.utils.hexlify(nonce),
        to: '0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045', // V神钱包：vitalik.eth
        value: ethers.utils.parseEther('0'),
        gasLimit: ethers.utils.hexlify(50000),
        gasPrice: ethers.utils.hexlify(await provider.getGasPrice()),
        data: ethers.utils.hexlify(ethers.utils.toUtf8Bytes('Stop dating and focus on pumping the market! By ZeBin@Hita')), // 消息内容：别谈恋爱了，好好拉盘！
        chainId: 1 
    }

    // 对交易进行签名
    const signedTx = await wallet.signTransaction(tx);
    // 发送签名交易
    const txResponse = await provider.sendTransaction(signedTx);
    // 输出交易 Hash
    console.log('Transaction sent:', txResponse.hash);
}

sendMessageToETH().catch(console.error);