require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require("@nomiclabs/hardhat-etherscan");

module.exports = {
  solidity: "0.8.10",
  networks: {
    matic : {
      url: "https://matic-mumbai.chainstacklabs.com/",
      accounts: [process.env.PRI_KEY],
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
    
  }
};
