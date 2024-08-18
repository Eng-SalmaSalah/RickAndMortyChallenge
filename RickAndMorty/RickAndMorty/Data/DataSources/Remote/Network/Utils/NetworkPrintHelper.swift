//
//  NetworkPrintHelper.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

class NetworkPrintHelper {
    static func logNetwork<T>(_ items: T, separator: String = " ", terminator: String = "\n") {
        print("""
            \n===================== 📟 ⏳ 📡 =========================
            \(items)
            ======================= 🚀 ⌛️ 📡 =========================
            """, separator: separator, terminator: terminator)
    }
    
    static func printRawResponse(data: Data) {
        print("Raw Response Data: \(data)")
        if let rawString = String(data: data, encoding: .utf8) {
            print("Raw Response String: \(rawString)")
        } else {
            print("Failed to convert raw data to string")
        }
    }
}
