const proofOfExistance1 = artifacts.require("ProofOfExistence3")

module.exports = function(deployer){
    deployer.deploy(proofOfExistance1);
}