//
//  ShareSecret.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 01.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//

import Security
import Foundation
import CryptoKit

class ShareSecret {
    
    static func create(privateKey :Data, applePublicKey: SecKey) -> Data?{
         guard let privateKey = try? P256.KeyAgreement.PrivateKey(rawRepresentation: privateKey) else{ 
            return nil
        }
        
        
        
        let attributes = [kSecAttrKeyType: kSecAttrKeyTypeECSECPrimeRandom,
                          kSecAttrKeyClass: kSecAttrKeyClassPrivate] as [String: Any]
        var error: Unmanaged<CFError>?
        // Get a SecKey representation.
        guard let secKey = SecKeyCreateWithData(privateKey.x963Representation as CFData,
                                                attributes as CFDictionary,
                                                &error)
            else {
                print( error!.takeRetainedValue())
                return nil
        }
        
        let keyPairAttr:[String : Any] = [kSecAttrKeySizeInBits as String: 256,
                                          SecKeyKeyExchangeParameter.requestedSize.rawValue as String: 32,
                                          kSecAttrKeyType as String: kSecAttrKeyTypeECSECPrimeRandom,
                                          kSecPrivateKeyAttrs as String: [kSecAttrIsPermanent as String: false],
                                          kSecPublicKeyAttrs as String:[kSecAttrIsPermanent as String: false]]
        
        guard let shared  = SecKeyCopyKeyExchangeResult(secKey, SecKeyAlgorithm.ecdhKeyExchangeStandard, applePublicKey , keyPairAttr as CFDictionary, &error), let sharedSecret = shared as? Data else {
            print( error!.takeRetainedValue() )
            return nil
        }
        
        
        print("shared secret:: \(sharedSecret.hexEncodedString())")
        return sharedSecret
    }
     
}
