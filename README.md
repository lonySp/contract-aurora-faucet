# AuroraFaucet

AuroraFaucet 是一个用于分发本地代币的水龙头智能合约。它允许用户请求固定数量的代币，并强制执行请求之间的最小时间间隔。合约所有者可以更改分发金额和请求间隔。

## 环境要求

- [Foundry](https://getfoundry.sh/) - Ethereum 开发工具包
- [Anvil](https://github.com/foundry-rs/foundry) - 本地开发链

## 安装

1. 克隆仓库并进入目录：

   ```bash
   git clone https://github.com/your-username/aurora-faucet.git
   cd aurora-faucet
   ```

2. 安装 Foundry：

   ```bash
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```

3. 创建 `.env` 文件并添加以下内容：

   ```plaintext
   PRIVATE_KEY_LOCAL=0xYOUR_LOCAL_PRIVATE_KEY
   PRIVATE_KEY_AURORA=0xYOUR_AURORA_PRIVATE_KEY
   LOCAL_RPC_URL=http://localhost:8545
   AURORA_RPC_URL=https://testnet.aurora.dev
   ```

## 使用

### 查看 Makefile 中的命令

```bash
make help
```

### 构建项目

```bash
make build
```

### 运行测试

```bash
make test
```

### 部署到本地 Anvil 链

1. 启动 Anvil：

   ```bash
   anvil
   ```

2. 部署合约：

   ```bash
   make deploy-local
   ```

### 部署到 Aurora 测试网

```bash
make deploy-aurora
```
