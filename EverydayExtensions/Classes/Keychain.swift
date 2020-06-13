//
//  Keychain.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 03.05.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import Foundation

public class Keychain {
    // MARK: - Public Methods

    @discardableResult public static func save(data: Data, for key: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecValueData as String: data,
                                    kSecAttrSynchronizable as String: kCFBooleanTrue!]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            return false
        }
        return true
    }

    public static func getData(for key: String) -> Data? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecReturnData as String: kCFBooleanTrue!,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecAttrSynchronizable as String: kCFBooleanTrue!]

        var item: CFTypeRef?
        SecItemCopyMatching(query as CFDictionary, &item)
        return item as? Data
    }

    @discardableResult public static func deleteData(for key: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecAttrSynchronizable as String: kCFBooleanTrue!]
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess || status == errSecItemNotFound
    }
}
