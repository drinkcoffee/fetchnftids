## Fetch ERC 721 NFT Owners

To determine the owners of NFTs in a collection. Optionally, just print out those NFT Ids owned by address 0x00.

To run the script:

```
forge script script/FetchNftOwners.s.sol:FetchNftOwners
```

Note: `script/FetchNftOwners.s.sol` contains constants to set the start and end NFT ID to search, the collection address, and whether to print out the owners of NFT Ids, or just the NFT Ids that are owned by address 0x00.

