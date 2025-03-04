//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/8/24.
//

import Foundation

extension Double {
    
    /// Converts a Double into a String currency with specified decimal ranges`
    func asCurrency(minDecimalRange: Int, maxDecimalRange: Int) -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = minDecimalRange
        formatter.maximumFractionDigits = maxDecimalRange
        let number = NSNumber(value: self)
        
        return formatter.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a 2 decimal place String
    /// ```
    /// Convert 1.23456 to 1.23
    /// ```
    func format2() -> String {
        return String(format: "%.2f", self)
    }
}
