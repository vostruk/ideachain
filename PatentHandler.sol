pragma solidity ^0.4.0;
contract PatentHandler {


    mapping(address => address) adressToPersonalDataHashes;
    mapping(address => address) personalDataHashToPatentHash;
    

    /// register user hashed personal data
    function registerUser(address userDataHash) public {
        require(adressToPersonalDataHashes[msg.sender]!=address(0), "User is not registered, not allowed to submit pattent.");
        
        adressToPersonalDataHashes[msg.sender] = userDataHash;
    }
    

    /// questions: what if pattent already exist?
    function submitPatent(address patentDataHash) public {
        require(adressToPersonalDataHashes[msg.sender]==address(0), "User is not registered, not allowed to submit pattent.");
        personalDataHashToPatentHash[adressToPersonalDataHashes[msg.sender]] = patentDataHash;
        
    }
    
     function checkPatent(address patentDataHash) public constant returns(bool){

        if (personalDataHashToPatentHash[adressToPersonalDataHashes[msg.sender]] == patentDataHash){
            return true;
        }
        else {
            return false;
        }
    }
    


}