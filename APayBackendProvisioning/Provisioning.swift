//
//  RunDown.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 01.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//

import UIKit
import CryptoKit

class Provisioning: NSObject {
    //apple certs

   
    func processStart(with applePublicKeyBase64String: String,
                      and nonce: String,
                      and nonceSignature: String,
                      and ephemeralPublicKey: String,
                      and ephemeralPrivateKey: String,
                      and cardJson: String) -> Data?{
        
        //Step 1: Apple Public Key
        guard let applePublicKey = ApplePublicKey.create(from: applePublicKeyBase64String) else {
              print(" step 1 failed")
                          return nil
        }
        //Step 2: Ephemeral key pairs
        guard let epubkey = ephemeralPublicKey.hexadecimal,
            let eprikey = ephemeralPrivateKey.hexadecimal
            else {
                print(" step 2 failed")
                return nil
        }
        //Step 3: Shared Secret
        guard let sharedSecret = ShareSecret.create(privateKey: eprikey, applePublicKey: applePublicKey)else {
            print(" step 3 failed")
            return nil
        }

        //Step 4: NIST Single-step KDF
        guard let kdfResult = NISTSingleStepKDF.create(from: sharedSecret, and: epubkey)else {
            print(" step 4 failed")
            return nil
        }
       
        //Step 5 Symmetric AES Key and Step 6: AES GCM Encryption
        guard let encryptedData = AESGCMEncryption.encrypt(jsonText: cardJson , with: kdfResult) else {
            print(" step 5,6 failed")
            return nil
        }
         
         //Step 7: prepare activation Data
        guard let resultJson = ActivationDataGenerator.createJSON(activationData: "network specific", publicKey: epubkey, encryptedData: encryptedData) else{
            print("cant generate activation data")
            return nil
        }
        
        
        return resultJson
        
        
        
    }
    
    
}










