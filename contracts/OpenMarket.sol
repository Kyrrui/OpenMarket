pragma solidity >=0.5.0;

import "./DAI.sol";
import "@openzeppelin/upgrades/contracts/Initializable.sol";

contract OpenMarket is Initializable {
    
    address private owner;
    DAI public dai;
    
    uint public numListings = 0;
    mapping(uint => uint) public isActiveListing; //0 Does not exist, 1 active, 2 closed
    mapping(uint => string) public listingName;
    mapping(uint => string) public listingDescription;
    mapping(uint => string) public listingImage;
    mapping(uint => uint) public listingPrice;
    
    mapping(uint => address) public listingSellerAddress;
    mapping(uint => address) public listingBuyerAddress;

    function initialize(DAI _dai) public initializer {
        owner = msg.sender;
        dai = _dai;
    }
    
    function addListing(string memory _name, string memory _desc, string memory _imgHash, uint _price) public {
        isActiveListing[numListings] = 1;
        listingName[numListings] = _name;
        listingDescription[numListings] = _desc;
        listingImage[numListings] = _imgHash;
        listingPrice[numListings] = _price;
        
        listingSellerAddress[numListings] = msg.sender;
        
        numListings = numListings + 1;
    
    }
    
    function buyListing(uint _listingNum) public {
        require(isActiveListing[_listingNum] == 1, "Not an active listing");
        require(
            dai.transferFrom(msg.sender, listingSellerAddress[_listingNum], listingPrice[_listingNum]), 
            "Not enough DAI to buy listing."
        );
        isActiveListing[numListings] = 2;
    }
    
    function removeListing(uint _listingNum) public {
        require(listingSellerAddress[_listingNum] == msg.sender);
        isActiveListing[numListings] = 2;
    }
    
}
