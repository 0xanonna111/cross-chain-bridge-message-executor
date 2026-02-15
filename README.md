# Cross-Chain Bridge Message Executor

This repository contains a professional framework for handling cross-chain communication. It demonstrates how to send and receive arbitrary data or asset instructions across different blockchain networks using a "Message Bus" pattern.

### Features
* **Interoperability:** Designed for EVM-to-EVM communication.
* **Security:** Includes validation logic to ensure messages only originate from trusted source contracts.
* **Asynchronous Execution:** Handles the lifecycle of a cross-chain transaction from initiation to destination execution.
* **Payload Encoding:** Uses professional ABI encoding for compact and secure data transmission.

### Technical Overview
1. **Source Chain:** The user calls `sendMessage()`, paying the cross-chain gas fee in the native currency.
2. **Relayer/Protocol:** The underlying protocol (simulated in this logic) picks up the event.
3. **Destination Chain:** The `lzReceive` or `executeMessage` function is called, validating the source before updating state.

### License
MIT
