//
//  DependencyContainer.swift
//  DependencyTest
//
//  Created by kaiserdem  on 12.12.2023.
//

import Foundation

class DependencyContainer: ObservableObject {
    var features: FeaturesContainer
    
    init() {
        self.features = FeaturesContainer()
    }
}
