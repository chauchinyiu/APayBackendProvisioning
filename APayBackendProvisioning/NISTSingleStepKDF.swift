//
//  NISTSingleStepKDF.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 02.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//
import Foundation

class NISTSingleStepKDF {
   
    static func create(from sharedScret: Data, and ephemeralPublicKey: Data) -> Data?{
 
        var result = "00000001" //counter
        result.append(sharedScret.hexEncodedString())
        result.append("0D") //13
        result.append("69642D6165733235362D47434D") //id-aes256-GCM
        result.append("4170706C65") //apple
        result.append(ephemeralPublicKey.hexEncodedString())
        print("KDF::: \(result)")
      
        return result.lowercased().hexadecimal
        
    }
}
