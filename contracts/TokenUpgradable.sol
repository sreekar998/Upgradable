//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";


contract MyTokenUpgradeable is Initializable, ERC20Upgradeable,  OwnableUpgradeable {
   

    function initialize() external initializer {
        __ERC20_init("MyToken", "MY");
        __Ownable_init();
          _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function mint(address to, uint amount) external onlyOwner {
        _mint(to, amount);
    }

}

contract FactoryContract is OwnableUpgradeable {
    //Instance of ERC20 contract
    MyTokenUpgradeable upgrade;

    //To keep track of the instances
    MyTokenUpgradeable[] public InstancesOfTokenCreation;


    //Only owner is allowed to create new instances
    function createNewContract()  public onlyOwner {
        upgrade = new MyTokenUpgradeable();
        InstancesOfTokenCreation.push(upgrade);
    }

    //To get all the instances created
    function getInstances() public view returns(MyTokenUpgradeable[] memory)  {
        return InstancesOfTokenCreation;
    }

}

