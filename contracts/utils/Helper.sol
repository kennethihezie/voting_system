// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.23;
import { Base64 } from "@openzeppelin/contracts/utils/Base64.sol";


library Helper {
    function createNftMetaData(string memory name, string memory position, string memory image) public pure returns(string memory) {
      bytes memory metadata = abi.encodePacked(
        "{",
        '"name": "', name, '", ',
        '"position": "', position, '", ',
        '"image": "', image, '", ',
        "}"
      );

      return string(
        abi.encodePacked(
            "data:application/json;base64,",
            Base64.encode(metadata)
        )
      );
    }
}