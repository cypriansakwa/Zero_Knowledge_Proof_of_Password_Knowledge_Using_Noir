// Main function for password proof
fn main(secret: [u8; 32], expected_hash: [u8; 32]) {
    // Compute the Blake2s hash of the secret
    let computed_hash = std::hash::blake2s(secret);

    // Assert that the computed hash matches the expected hash
    assert(computed_hash == expected_hash);
}

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
