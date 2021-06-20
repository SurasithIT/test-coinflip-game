const ethers = require("ethers");
require("dotenv").config();

// const contractJSON = require("./build/contracts/KOSCoinflip.json");
const contractJSON = require("./build/contracts/KOSCoinflip.json");

const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545");

let privateKey = process.env.WALLET_PRIVATE_KEY;
// console.log("privateKey : ", privateKey);
let wallet = new ethers.Wallet(privateKey, provider);
console.log("wallet : ", wallet);

// init contract
const contractAddress = process.env.CONTRACT_ADDRESS;
const contractABI = contractJSON.abi;
let contract = new ethers.Contract(contractAddress, contractABI, provider);
// console.log(contract);

// init contract with sign wallet
let contractWithSigner = contract.connect(wallet);

const getSender = async () => {
  contract
    .getPlayer1Address()
    .then((result) => {
      console.log(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const transfer = async (_transferTo, _transferFrom, _amount) => {
  contractWithSigner
    .transferFund(_transferTo, {
      from: _transferFrom,
      value: _amount,
      //   value: web3.toWei(_amount, "ether"),
    })
    .then((result) => {
      console.log(result);
    })
    .catch((err) => {
      console.log(err);
    });
};
// console.log(global);

// console.log(wallet.address);
// transfer(
// //   "0x0e280357a8Ff7844257452C2a40C9dD7B4ebD436",
//   "0x9A524a1f23C44572A1b0A9D278C1731f74EbcA50",
//   ethers.utils.parseEther("10")
// );

// contractWithSigner.sendTransaction({
//     to: "0x0e280357a8Ff7844257452C2a40C9dD7B4ebD436",
//     value: ethers.utils.parseEther("10")
// });

const bet = async () => {
  contract
    .bet(1, 2)
    .then((result) => {
      console.log(result[0]);
      console.log(result[1]);
    })
    .catch((err) => {
      console.log(err);
    });
};

const setPlayer = async () => {
  contractWithSigner
    .setPlayer(
      "0x9A524a1f23C44572A1b0A9D278C1731f74EbcA50",
      "0x0e280357a8Ff7844257452C2a40C9dD7B4ebD436"
    )
    .then((result) => {
      console.log(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

// setPlayer();
bet();
