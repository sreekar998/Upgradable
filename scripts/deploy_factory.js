const { ethers, upgrades } = require("hardhat");
async function main() {
    const FactoryContract = await ethers.getContractFactory("FactoryContract");
    const factoryContract = await FactoryContract.deploy();
    await factoryContract.deployed();
    console.log("Factory contract deployed to:", factoryContract.address);
}
main();