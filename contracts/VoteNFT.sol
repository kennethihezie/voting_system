// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.23;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import { Strings } from "@openzeppelin/contracts/utils/Strings.sol";
import { IVoteNFT } from "./interfaces/IVoteNFT.sol";
import { Helper } from "./utils/Helper.sol";

/**
 * @title VoteNFT Smart Contract
 * @author Collins Ihezie
 * createdAt: 8/02/2024  
 */

contract VoteNFT is ERC721URIStorage, IVoteNFT {
    constructor() ERC721("VoteNFT", "VFT") {}

    uint256 private _tokenID;

    function mint(VoteNftMetaData memory voteNftMetaData) external override returns (uint256) {
        uint256 tokenId = _tokenID;
       _safeMint(msg.sender, tokenId);
       _setTokenURI(tokenId, Helper.createNftMetaData(voteNftMetaData.name, voteNftMetaData.position, voteNftMetaData.image));
       _tokenID++;

       return tokenId;
    }

    function getNftTokenURI(uint256 tokenId) external view override returns (string memory) {
      return tokenURI(tokenId);
    }

    function getNftOwner(uint256 tokenId) external view override returns (address) {
      return ownerOf(tokenId);
    }

    function getBalanceOf(address user) external view override returns (uint256) {
     return balanceOf(user);
    }
}