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

    /*
    string baseSvg =
        "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

    string[] layers1 = [
        "Horse",
        "Mouse",
        "Cup",
        "Spinner",
        "YOLO",
        "Table",
        "Love"
    ];
    string[] layers2 = [
        "Conditioner",
        "White",
        "Jar",
        "Bee",
        "Couple",
        "Cat",
        "Back"
    ];
    string[] layers3 = [
        "Tree",
        "House",
        "Banana",
        "Poster",
        "Window",
        "Reject",
        "Tracker"
    ];
    */

    constructor() ERC721("SquareNFT", "Square") {
        console.log("This is an NFTeddy");
    }

    /*
    function pickRandomFirstLayer(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("FIRST_LAYER", Strings.toString(tokenId)))
        );
        rand = rand % layers1.length;
        return layers1[rand];
    }

    function pickRandomSecondLayer(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("SECOND_LAYER", Strings.toString(tokenId)))
        );
        rand = rand % layers2.length;
        return layers2[rand];
    }

    function pickRandomThirdLayer(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("THIRD_LAYER", Strings.toString(tokenId)))
        );
        rand = rand % layers3.length;
        return layers2[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }
    */
    
    function makeAnNFTeddy() public {
        //require(owns[msg.sender]==false , "Only one nfTeddy per user");
        uint256 newItemId = _tokenIds.current();

        /*
        string memory first = pickRandomFirstLayer(newItemId);
        string memory second = pickRandomSecondLayer(newItemId);
        string memory third = pickRandomThirdLayer(newItemId);

        string memory combinedWord = string(
            abi.encodePacked(first, second, third)
        );

        string memory finalSvg = string(
            abi.encodePacked(baseSvg, combinedWord, "</text></svg>")
        );
        */

        /*
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        combinedWord,
                        '", "description": "A highly acclaimed collection of squares.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );
        */

        /*
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        console.log("\n--------------------");
        console.log(
            string(
                abi.encodePacked(
                    "https://nftpreview.0xdev.codes/?code=",
                    finalTokenUri
                )
            )
        );
        console.log("--------------------\n");

        */
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
