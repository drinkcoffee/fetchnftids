// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IERC721} from "forge-std/interfaces/IERC721.sol";

contract FetchNftOwners is Script {
    uint256 internal constant MIN_TOKEN_ID = 9900;
    uint256 internal constant MAX_TOKEN_ID = 10010;

    /// @dev ERC721 collection address
    address internal constant COLLECTION = 0x3b6064228E85946BC8c95AD4f687b0275C599395;

    /// @dev RPC URL for Immutable
    string internal constant RPC_URL = "https://rpc.immutable.com";

    bool internal constant SHOW_ALL_OWNERS = false;

    function run() external {
        vm.createSelectFork(RPC_URL);

        IERC721 nft = IERC721(COLLECTION);
        address zeroAddr = address(0);

        for (uint256 tokenId = MIN_TOKEN_ID; tokenId <= MAX_TOKEN_ID; tokenId++) {
            address owner;
            try nft.ownerOf(tokenId) returns (address o) {
                owner = o;
            } catch {
                // Token does not exist or call reverted — treat as unowned
                owner = zeroAddr;
            }
            if (SHOW_ALL_OWNERS) {
                console.log("Token ID %s has owner: %s", tokenId, owner);
            } else if (owner == zeroAddr) {
                console.log("%s", tokenId);
            }
        }
    }
}
