# OpenZKA Technical Architecture

## Overview
OpenZKA implements a three-layer architecture for privacy-preserving analytics:

1. **Identity Layer:** W3C DID/VC wallets
2. **Proof Layer:** Circom ZK circuits
3. **Aggregation Layer:** Off-chain batch verification

## Circuit Design

### Range Proof Circuit
Located: `/circuits/range_proof.circom`

**Purpose:** Prove a survey answer falls within valid bounds without revealing the answer.

**Inputs:**
- Private: `value` (the actual answer), `nullifier_secret` (user's private key)
- Public: `min`, `max` (valid range), `survey_id` (context)

**Outputs:**
- `nullifier` (prevents double-voting)
- `valid` (constraint satisfaction proof)

**Constraints:** ~150 (optimized for browser-based proof generation)

### [Future] Merkle Membership Circuit
Status: Planned for Phase 1 implementation

### [Future] Nullifier Circuit
Status: Planned for Phase 1 implementation

## Security Model

**Threat:** Sybil attacks (user submits multiple proofs)  
**Mitigation:** Deterministic nullifiers tied to `survey_id`

**Threat:** Invalid data submission (e.g., value = 999)  
**Mitigation:** Range constraints enforced at circuit level

**Threat:** Toxic waste leakage (trusted setup)  
**Mitigation:** Use Perpetual Powers of Tau ceremony

## Performance Targets (TRL-5)

- Proof generation: <2s (browser, WASM)
- Proof size: <1KB
- Verification gas: <300k (Ethereum mainnet)
- Batch aggregation: 100+ proofs/second

---
*Document version: 0.1-alpha (Pre-funding)*
```

