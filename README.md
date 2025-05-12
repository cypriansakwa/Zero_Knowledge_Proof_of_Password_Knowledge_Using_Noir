# Zero-Knowledge Password Proof using Noir

## Overview
This Noir code demonstrates how to prove knowledge of a password without revealing it. The proof uses the **Blake2s** hashing algorithm to compute a hash of the password and verifies that the computed hash matches the expected hash. 

## Main Function
The main function computes the Blake2s hash of a secret password and asserts that it matches the expected hash.

### Code
```noir
// Main function for password proof
fn main(secret: [u8; 32], expected_hash: [u8; 32]) {
    // Compute the Blake2s hash of the secret
    let computed_hash = std::hash::blake2s(secret);

    // Assert that the computed hash matches the expected hash
    assert(computed_hash == expected_hash);
}
```
## Test Function
The test function verifies the correctness of the password proof by:
- Creating a password as a 32-byte array (ASCII for "password" followed by zeros).
- Precomputing the hash of the password using Blake2s within Noir.
- Calling the `main` function to verify the proof.
## Code
```noir
// Test function to verify password proof
#[test]
fn test_password_proof() {
    // Example password as a 32-byte array (ASCII for "password" followed by zeros)
    let password: [u8; 32] = [112, 97, 115, 115, 119, 111, 114, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    // Precompute the hash of the password using Blake2s within Noir
    let expected_hash: [u8; 32] = std::hash::blake2s(password);

    // Call the main function to verify the proof
    main(password, expected_hash);
}
```
## Installation
To use this code, make sure you have the **Noir** programming environment set up. Follow these steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/cypriansakwa/Zero_Knowledge_Proof_of_Password_Knowledge_Using_Noir.git
   cd Zero_Knowledge_Proof_of_Password_Knowledge_Using_Noir
   ```
3. Compile and run the tests:
   ```bash
   nargo test
   ```
## Usage
1. The main function takes two arguments:
   - `secret`: A 32-byte array representing the password.
   - `expected_hash`: A 32-byte hash generated from the password.
2. The test function demonstrates the use of the main function with an example password.
## Troubleshooting
If you encounter errors related to hashing or function calls:
 - Make sure you have the correct version of Noir installed.
 - Verify that the `std::hash::blake2s` function is correctly imported and used.
## When is it Useful?
This proof of password knowledge technique is useful when:
 - You want to prove knowledge of a password without revealing the actual password.
 - You need to verify password authenticity while maintaining privacy.
 - You are working with zero-knowledge proof systems that use Noir.
## References
- [Noir Documentation](https://noir-lang.org/)
- [Blake2s Hash Algorithm](https://www.rfc-editor.org/rfc/rfc7693)

