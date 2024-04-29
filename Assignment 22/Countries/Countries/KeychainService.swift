//
//  KeychainService.swift
//  Countries
//
//  Created by Gega on 4/28/24.
//

import Foundation
import Security

class KeychainService {
    static func savePassword(username: String, password: String) {
        guard let passwordData = password.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: username,
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { return }
    }
    
    static func getPassword(forUsername username: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: username,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        guard status == errSecSuccess, let retrievedData = dataTypeRef as? Data else { return nil }
        
        return String(data: retrievedData, encoding: .utf8)
    }
}
