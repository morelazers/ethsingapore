pragma solidity 0.4.24;

import "KyberNetworkProxy.sol";
import "ERC20.sol";

contract KyberEthToTokenProxy {
    
    KyberNetworkProxy public kyberProxy;
    ERC20 public constant ETH_TOKEN_ADDRESS = ERC20(0x00eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee);
    uint public constant MAX_QTY = (10**28);
    
    constructor (address _kyberProxy) public {
        kyberProxy = KyberNetworkProxy(_kyberProxy);
    }
    
    function swapEthToTokenWithDestination (ERC20 _tokenAddress, uint _minConversionRate, address _destAddress) public payable returns (uint) {
        bytes memory hint;
        return kyberProxy.tradeWithHint.value(msg.value)(
            ETH_TOKEN_ADDRESS,
            msg.value,
            _tokenAddress,
            _destAddress,
            MAX_QTY,
            _minConversionRate,
            0,
            hint
        );
    }
    
}