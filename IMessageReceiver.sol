// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IMessageReceiver {
    function onMessageReceived(
        uint16 srcChainId,
        address srcAddress,
        bytes calldata payload
    ) external;
}
