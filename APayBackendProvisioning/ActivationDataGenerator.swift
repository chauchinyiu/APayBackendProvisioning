//
//  ActivationDataGenerator.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 03.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//

import Foundation
import CryptoSwift

class ActivationDataGenerator: NSObject {

    static func createJSON(activationData: String, publicKey: Data, encryptedData: Data) -> Data? {
        guard let activationDataBase64 = activationData.bytes.toBase64() else {
            return nil
        }
              
        let jsonObject: [String: Any] = [
            "activationData": activationDataBase64,
            "ephemeralPublicKey": publicKey.base64EncodedString(),
            "encryptedData":  encryptedData.base64EncodedString()
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
              let jsonString = String.init(data: jsonData, encoding: String.Encoding.utf8) else {
                  assertionFailure("JSON string creation failed.")
                  return nil
              }
        print(jsonString)
        return jsonData
    }
}
