pragma circom 2.0.0;

include "circomlib/comparators.circom";
include "circomlib/poseidon.circom";

// Proves that a value is within [min, max] without revealing the value
template RangeProof(n) {
    signal input value;          // Private: the actual survey answer
    signal input min;            // Public: minimum valid value (e.g., 1)
    signal input max;            // Public: maximum valid value (e.g., 5)
    signal input nullifier_secret; // Private: user's secret for nullifier
    signal input survey_id;      // Public: prevents reuse across surveys
    
    signal output nullifier;     // Public: prevents double-voting
    signal output valid;         // Public: 1 if range check passed

    // Check value >= min
    component geq = GreaterEqThan(n);
    geq.in[0] <== value;
    geq.in[1] <== min;
    
    // Check value <= max
    component leq = LessEqThan(n);
    leq.in[0] <== value;
    leq.in[1] <== max;
    
    // Both constraints must be satisfied
    valid <== geq.out * leq.out;
    valid === 1;
    
    // Generate deterministic nullifier to prevent Sybil attacks
    component hasher = Poseidon(3);
    hasher.inputs[0] <== nullifier_secret;
    hasher.inputs[1] <== survey_id;
    hasher.inputs[2] <== value; // Include value for uniqueness
    
    nullifier <== hasher.out;
}

// Main component for 8-bit values (0-255)
component main {public [min, max, survey_id]} = RangeProof(8);
