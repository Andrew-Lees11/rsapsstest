import CryptorRSA

if #available(OSX 10.12, *) {
    do {
        let (priKey, pubKey) = try CryptorRSA.makeKeyPair(.bits2048)
        let testValue = try CryptorRSA.createPlaintext(with: "Hello World", using: .utf8) 
        let signature = try testValue.signed(with: priKey, algorithm: .sha256, usePSS: true)!
        let verified = try testValue.verify(with: pubKey, signature: signature, algorithm: .sha256, usePSS: true)
        print(verified)
    } catch {
        print("Error: \(error)")
    }
} 
