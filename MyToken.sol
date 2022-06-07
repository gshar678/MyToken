// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    event Withdraw (uint256 amountSent, uint256 gasRefund);
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 100 * 10 ** decimals());
    }


  function transferWithRefund( address to, uint256 amount) public payable {

    uint256 GasA = gasleft();

    transfer( to, amount);

    uint256 gasUsed = GasA - gasleft();

    payable(msg.sender).transfer(gasUsed);	

    emit Withdraw(amount, gasUsed);


  }

}
