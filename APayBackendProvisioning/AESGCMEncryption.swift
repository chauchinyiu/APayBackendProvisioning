//
//  SymmetricAESKey.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 02.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//

import Foundation
import CryptoSwift

class AESGCMEncryption: NSObject {
    
    static func encrypt(jsonText: String, with kdfInput: Data) -> Data? {
        
        let hashed = kdfInput.sha256()
        
        
        print(hashed.toHexString())
        
        guard let data = jsonText.data(using: .utf8) else {
            return nil
        }
        
        
        let iv: Array<UInt8> = [0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00]
        let gcm = GCM(iv: iv, mode: .combined)
        guard let aes = try? CryptoSwift.AES(key: [UInt8](hashed), blockMode: gcm, padding: .noPadding)
             ,let encrypted = try? aes.encrypt([UInt8](data))
             ,let tag = gcm.authenticationTag else {
                return nil
        }
       
        
        print("encrypted :: \(encrypted.toHexString())")
        print("tag :: \(tag.toHexString())")
        
        return encrypted.toHexString().hexadecimal
    }
}


