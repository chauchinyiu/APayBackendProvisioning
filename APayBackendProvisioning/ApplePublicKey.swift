//
//  ApplePublicKey.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 02.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//

import Foundation

class ApplePublicKey {
 
    static func create(from base64String: String) -> SecKey?{
        guard let data = Data(base64Encoded: base64String) as CFData?,
             let cert = SecCertificateCreateWithData(nil,data),
             let applePublicKey = SecCertificateCopyKey(cert),
             let represnt = SecKeyCopyExternalRepresentation(applePublicKey, nil) else
         {
             print("step 1 failed")
             return nil
         }
         print("Cert key: \(applePublicKey)")
         print("applePublicKey represent: \(represnt)")
         return applePublicKey
    }
}
