// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract proofOfExistence3 {
  // see if the given value is there
  mapping (bytes32 => bool) private proofs;

  // store a proof of existance in the mapping
  function storeProof(bytes32 proof) public {
    proofs[proof] = true;
  }

  // calculate and store proof of a doc
  function notarize(string memory document) public {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  // get a document hash
  function proofFor(string memory document) public view returns(bytes32) {
    return sha256(abi.encode(document));
  }

  // see if the proof already exist
  function checkDocument(string memory document) public view returns(bool){
    bytes32 proof = proofFor(document);
    return hashProof(proof);
  }

  function hashProof(bytes32 proof)public view returns(bool) {
    return proofs[proof];
  }
}
