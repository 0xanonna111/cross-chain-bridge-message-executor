// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./IMessageReceiver.sol";

contract BridgeExecutor is Ownable, IMessageReceiver {
    mapping(uint16 => address) public trustedRemotes;
    
    event MessageSent(uint16 indexed dstChainId, address indexed target, bytes payload);
    event MessageExecuted(uint16 indexed srcChainId, address indexed srcAddress, bytes payload);

    constructor() Ownable(msg.sender) {}

    function setTrustedRemote(uint16 _chainId, address _remoteAddress) external onlyOwner {
        trustedRemotes[_chainId] = _remoteAddress;
    }

    function sendMessage(
        uint16 _dstChainId,
        address _target,
        string calldata _message
    ) external payable {
        bytes memory payload = abi.encode(_target, _message);
        
        // In a real scenario, this would call the LayerZero or CCIP Router
        emit MessageSent(_dstChainId, _target, payload);
    }

    function onMessageReceived(
        uint16 _srcChainId,
        address _srcAddress,
        bytes calldata _payload
    ) external override {
        require(msg.sender == address(this), "Only endpoint can call");
        require(_srcAddress == trustedRemotes[_srcChainId], "Unauthorized source");

        (address target, string memory message) = abi.decode(_payload, (address, string));
        
        // Execute business logic here
        emit MessageExecuted(_srcChainId, _srcAddress, _payload);
    }
}
