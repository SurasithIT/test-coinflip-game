pragma solidity >=0.4.22 <0.9.0;

contract KOSCoinflip {
    address player1;
    address player2;
    uint256 player1Balance;
    uint256 player2Balance;

    event TransferFund(
        address _transferTo,
        address _transferFrom,
        uint256 amount
    );

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

    function random() private view returns (uint16) {
        uint256 randomHash =
            uint256(
                keccak256(abi.encodePacked(block.difficulty, block.timestamp))
            );
        return uint16(randomHash);
    }

    function setPlayer(address _player1, address _player2) public {
        player1 = _player1;
        player2 = _player2;
    }

    function bet(uint16 _address1res, uint16 _address2res)
        public
        view
        returns (uint16, address)
    {
        uint16 answer = random();
        address winner;
        if (_address1res == answer) {
            winner = player1;
        } else if (_address2res == answer) {
            winner = player2;
        }
        return (answer, winner);
    }

    function transfer(address payable _transferTo)
        public
        payable
        returns (bool)
    {
        // transferTo = _transferTo;
        _transferTo.transfer(msg.value);

        emit TransferFund(_transferTo, msg.sender, msg.value);

        return true;
    }
}
