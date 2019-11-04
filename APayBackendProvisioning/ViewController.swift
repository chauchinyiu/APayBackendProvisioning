//
//  ViewController.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 01.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var base64String = "MIIEEjCCA7igAwIBAgIIEccnFAKsD+UwCgYIKoZIzj0EAwIwgYExOzA5BgNVBAMMMlRlc3QgQXBwbGUgV29ybGR3aWRlIERldmVsb3BlcnMgUmVsYXRpb25zIENBIC0gRUNDMSAwHgYDVQQLDBdDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTETMBEGA1UECgwKQXBwbGUgSW5jLjELMAkGA1UEBhMCVVMwHhcNMTkwODA3MjA1NzA5WhcNMjEwNzEzMDI1ODAwWjBtMTYwNAYDVQQDDC1lY2MtY3J5cHRvLXNlcnZpY2VzLWVuY2lwaGVybWVudF9VQzYtSW5NZW1vcnkxETAPBgNVBAsMCEFwcGxlUGF5MRMwEQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUzBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABC4+XM9rmrBL56IvP6zP3nPIfocVU5SjSBVAiolsoYo3TaxmmvO/YiD8hjdn9K9HUHxbwiH8ShmHTa85tAdOPrijggIrMIICJzAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFNbW1Vrl//3CfDTDQ969aHZcNqm+ME8GCCsGAQUFBwEBBEMwQTA/BggrBgEFBQcwAYYzaHR0cDovL29jc3AtdWF0LmNvcnAuYXBwbGUuY29tL29jc3AwNC10ZXN0d3dkcmNhZWNjMIIBHQYDVR0gBIIBFDCCARAwggEMBgkqhkiG92NkBQEwgf4wgcMGCCsGAQUFBwICMIG2DIGzUmVsaWFuY2Ugb24gdGhpcyBjZXJ0aWZpY2F0ZSBieSBhbnkgcGFydHkgYXNzdW1lcyBhY2NlcHRhbmNlIG9mIHRoZSB0aGVuIGFwcGxpY2FibGUgc3RhbmRhcmQgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdXNlLCBjZXJ0aWZpY2F0ZSBwb2xpY3kgYW5kIGNlcnRpZmljYXRpb24gcHJhY3RpY2Ugc3RhdGVtZW50cy4wNgYIKwYBBQUHAgEWKmh0dHA6Ly93d3cuYXBwbGUuY29tL2NlcnRpZmljYXRlYXV0aG9yaXR5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLXVhdC5jb3JwLmFwcGxlLmNvbS9hcHBsZXd3ZHJjYWVjYy5jcmwwHQYDVR0OBBYEFK0uo8t+NMLt7kNoTicRH8xJMznQMA4GA1UdDwEB/wQEAwIDKDASBgkqhkiG92NkBicBAf8EAgUAMAoGCCqGSM49BAMCA0gAMEUCIQCKEXnIsY2PZqMF2xHKehKgp/ZywZ/9/TZ+AnpOA6mI/AIgTI94NSaIn7DLd47QTK760WILDOr0EdOHiExJMZwYp7c="
    let nonce = "nonce"
    let nonceSignature = "noncesignature"
    //Ephemeral Public Key
    let hexEPublicKey =
    "0499A6F42E83EA4F150A78780FFB562C9CDB9B7507BC5D28CBFBF8CC3EF0AF68B36E60CB10DB69127830F7F899492017089E3B73C83FCF0EBDF2C06B613C3F88B7"
    
    //Ephemeral Private Key
    let hexEPrivateKey = "7EEE47DEE108A08EDD2BCD2BB762A543CA23EA96C9AF09AD54BEB9FA3CE1A026"
    
    let jsonPayLoad = "{\"Parameter1\":\"Value1\",\"Parameter2\":\"Value2\",\"Parameter3\":\"Value3\"}"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       _ = Provisioning().processStart(with: base64String, and: nonce, and: nonceSignature, and: hexEPublicKey, and: hexEPrivateKey, and: jsonPayLoad)
    }

    @IBAction func reload(){
        _ =  Provisioning().processStart(with: base64String, and: nonce, and: nonceSignature, and: hexEPublicKey, and: hexEPrivateKey, and: jsonPayLoad)
    }
}

