// scripts/deploy_upgradeable_box.js
const { ethers, upgrades } = require("hardhat");

async function main() {
    const MyTokenUpgradeable = await ethers.getContractFactory("MyTokenUpgradeable");
    const myTokenUpgradeable = await upgrades.deployProxy(MyTokenUpgradeable, { initializer: "initialize",});
    await myTokenUpgradeable.deployed();
    console.log("Upgradable Token deployed to:", myTokenUpgradeable.address);


}
main();