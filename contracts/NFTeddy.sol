// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import {Base64} from "./libraries/Base64.sol";

contract NFTeddy is ERC721URIStorage {
    event newNFTeddy(address sender, uint256 tokenId);
    mapping(address => bool) owns;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("SquareNFT", "Square") {
        console.log("This is an NFTeddy");
    }
    
    function makeAnNFTeddy() public {
        //require(owns[msg.sender]==false , "Only one nfTeddy per user");
        uint256 newItemId = _tokenIds.current();

     
        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "ipfs://QmbJMnaLQpR94HrQ6EzehSPV3WpsCUKQN7A4JMzabDUxz7");

        console.log(
            "An NFT with id %s has been minted to",
            newItemId,
            msg.sender
        );

        _tokenIds.increment();
        owns[msg.sender] = true;
        emit newNFTeddy(msg.sender, newItemId);
    }
}
