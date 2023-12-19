//
//  FeaturesContainer.swift
//  DependencyTest
//
//  Created by kaiserdem  on 12.12.2023.
//

class FeaturesContainer {
    
    lazy var contentFeature: ProductInjector = {
        ProductInjector()
    }()
}
