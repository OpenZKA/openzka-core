# OpenZKA: The Trust Layer for European Data Spaces

![OpenZKA Logo](Logo%20-%20open%20zka.png) 

**OpenZKA** is an open-source middleware library designed to solve the "Sovereign Gap" in European market research. It enables **Blind Statistical Aggregation** using Zero-Knowledge Proofs (ZKP) and W3C Verifiable Credentials.

## 🇪🇺 The Mission
Currently, Europe lacks a sovereign instrument for privacy-preserving market analytics. OpenZKA allows organizations to verify aggregate outcomes (e.g., "70% of users match criteria X") without ever collecting raw personal data (PII), creating a compliant "Verifier-Pays" economy.

## 🏗 Architecture
This library provides the cryptographic primitives to:
1.  **Ingest** ZKP proofs from user wallets (Identity Holder).
2.  **Aggregate** proofs into statistical insights off-chain.
3.  **Issue** a verifiable report (VC) to the Data Buyer.

## 🧩 Components (Planned)
*   `/circuits`: Circom templates for blind aggregation.
*   `/contracts`: Smart contracts for verifying proofs on EVM.
*   `/lib`: TypeScript adaptors for W3C DID.

## 📜 License
This project is licensed under the **MPL 2.0 License**.

## 🤝 Governance
OpenZKA is an initiative maintained by **Trustvestor Ltd.**
*Applying for funding under the NGI Zero Commons Fund (2025-2026).*
