//
//  DoubleExtension.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import Foundation

extension Double {
    
    private static let arc4randomMax = Double(UInt32.max)

    static func random0to1() -> Double {
         return Double(arc4random()) / arc4randomMax
    }
}
