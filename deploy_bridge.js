const hre = require("hardhat");

async function main() {
  const Bridge = await hre.ethers.getContractFactory("BridgeExecutor");
  const bridge = await Bridge.deploy();

  await bridge.waitForDeployment();
  console.log(`Bridge Executor deployed to: ${await bridge.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
