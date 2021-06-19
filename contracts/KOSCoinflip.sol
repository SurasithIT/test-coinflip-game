pragma solidity >=0.4.22 <0.9.0;

contract KOSCoinflip {
    address player1;
    address player2;
    uint256 player1Balance;
    uint256 player2Balance;

    constructor(address _player1, address _player2) public {
        player1 = _player1;
        player1Balance = _player1.balance;
        player2 = _player2;
        player2Balance = _player2.balance;
    }

    function getPlayer1Address() public view returns (address) {
        return player1;
    }

    function getPlayer2Address() public view returns (address) {
        return player2;
    }

    function getPlayer1Balance() public view returns (uint256) {
        return player1Balance;
    }

    function getPlayer2Balance() public view returns (uint256) {
        return player2Balance;
    }

    function random() public view returns (uint16) {
        uint256 randomHash =
            uint256(
                keccak256(abi.encodePacked(block.difficulty, block.timestamp))
            );
        return uint16(randomHash % 2);
    }

    function tossCoin(uint16 _address1res, uint16 _address2res)
        public
        view
        returns (address)
    {
        uint16 answer = random();
        address winner;
        if (_address1res == answer) {
            winner = player1;
        } else if (_address2res == answer) {
            winner = player2;
        }
        return winner;
    }
}

contract AB {
    uint256 num1;
    address owner;
    address receiver;

    constructor(address _receiver) public {
        owner = msg.sender;
        receiver = _receiver;
    }

    function sendBalance(address payable receiver) public payable {
        uint256 amount = msg.value;
        receiver.transfer(amount);
    }

    function getOwnerBalance() public view returns (uint256) {
        return msg.sender.balance;
    }

    function getReceiverBalance() public view returns (uint256) {
        return receiver.balance;
    }
}
