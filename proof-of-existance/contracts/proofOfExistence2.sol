// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract proofOfExistence2 {
  // list to store the proof
  bytes32[] private proofs;

  // store a proof in the list
  function storeProof(bytes32 proof) public {
    proofs.push(proof );
  }

  // give a documment that will be change into a proof and then store in the list
  function notarize(string memory document) public {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  // make the proof
  function proofFor(string memory document) public view returns (bytes32){
    return sha256(abi.encode(document));
  }

  // 
  function checkDocument(string memory  document) public view returns (bool) {
    bytes32 proof = proofFor(document);
    return hashProof(proof);
  }

  function hashProof(bytes32 proof) public view returns (bool) {
    for(uint256 i = 0; i < proofs.length ; i++){
      if(proofs[i] == proof){
        return true;
      }
    }

    return false;
  }

}
