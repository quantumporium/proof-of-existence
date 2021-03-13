// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract ProofOfExistance1 {
  bytes32 public proof;

  function notarize(string memory _document) public {
    proof = proofFor( _document );
  }

  function proofFor(string memory document ) public view returns (bytes32){
    return sha256(abi.encode(document));
  }
}
