// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.23;

interface IVoteNFT {
    // Struct for NFT metadata
    struct VoteNftMetaData {
        string name;
        string position;
        string image;
    }

    /**
     * @dev Mint NFT to caller
     * @param voteNftMetaData VoteNftMetaData is the struct for the nft metadata 
     */
    function mint(VoteNftMetaData memory voteNftMetaData) external returns(uint256);

    /**
     * @dev gets the nft token URI
     * @param tokenId tokenID to get the token URI
     */
    function getNftTokenURI(uint256 tokenId) external view returns(string memory);

    /**
     * @dev get the nft owner
     * @param tokenId tokenID to get the owner of the NFT
     */
    function getNftOwner(uint256 tokenId) external view returns(address);

    /**
     * @dev get the nft balance of user
     * @param user address of user to get balance
     */
    function getBalanceOf(address user) external view returns(uint256);
}