//
//  ProductDataServiceProtocol.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import Foundation

protocol ProductDataServiceProtocol {
    var productsPublisher: Published<[Product]>.Publisher? { get }
    func addProduct(_ product: ProductModel)
}
