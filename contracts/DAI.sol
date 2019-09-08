pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

/**
 * @title TanganyTestToken
 * @dev Simple ERC20 Token example yielding 10000 tokens pre-assigned to its creator.
 */
contract DAI is ERC20, ERC20Detailed {
    // modify token name
    string public constant NAME = "FAKE DAI";
    // modify token symbol
    string public constant SYMBOL = "DAI";
    // modify token decimals
    uint8 public constant DECIMALS = 18;
    // modify initial token supply
    uint256 public constant INITIAL_SUPPLY = 100000000 * (10 ** uint256(DECIMALS)); // 10000 tokens

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () public ERC20Detailed(NAME, SYMBOL, DECIMALS) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}