# Makefile

# Load environment variables from .env file
include .env
export $(shell sed 's/=.*//' .env)

# Default target
all: build test

# Build the project
build:
	@echo "Building the project..."
	forge build

# Run tests
test: build
	@echo "Running tests..."
	forge test

# Clean the build directory
clean:
	@echo "Cleaning the build directory..."
	forge clean

# Deploy to local Anvil chain
deploy-local: build
	@echo "Deploying to local Anvil chain..."
	forge script script/DeployAuroraFaucet.t.sol --rpc-url $(LOCAL_RPC_URL) --private-key $(PRIVATE_KEY_LOCAL) --broadcast

# Deploy to Aurora testnet
deploy-aurora: build
	@echo "Deploying to Aurora testnet..."
	forge script script/DeployAuroraFaucet.t.sol --rpc-url $(AURORA_RPC_URL) --private-key $(PRIVATE_KEY_AURORA) --broadcast

# Help message
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all             Build the project and run tests"
	@echo "  build           Build the project"
	@echo "  test            Run tests"
	@echo "  clean           Clean the build directory"
	@echo "  deploy-local    Deploy to local Anvil chain"
	@echo "  deploy-aurora   Deploy to Aurora testnet"
	@echo "  help            Show this help message"
