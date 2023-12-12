//
//  ProductDataServiceProtocol.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import Dependency
import Foundation

protocol ProductDataServiceProtocol {
    var productsPublisher: Published<[Product]>.Publisher? { get }
    func addProduct(_ product: ProductModel)
}

private struct ProductDataServiceKey: DependencyKey {
    static var currentValue: ProductDataServiceProtocol = ProductDataService()
}

extension DependencyValues {
    var productDataService: ProductDataServiceProtocol {
        get { Self[ProductDataServiceKey.self] }
        set { Self[ProductDataServiceKey.self] = newValue }
    }

}
