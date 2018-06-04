pragma solidity ^0.4.2;

contract Election {
    //Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
         }
     // Store accounts that have voted
    mapping(address => bool) public voters;
    //Store candidate
    //Read candidate
    //will also Write candidate later
    //Fetch candidate
    mapping (uint=>Candidate) public candidates;
    //Store candidates count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );
    
    //This is a constructor
    function Election() public {
        addCandidate("otedola");
        addCandidate("dangote");
         }

    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0);
        
    }

      function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        votedEvent(_candidateId);
    }
    
}