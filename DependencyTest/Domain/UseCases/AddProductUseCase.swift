//
//  AddProductUseCase.swift
//  DependencyTest
//
//  Created by kaiserdem  on 13.12.2023.
//

import Foundation

class AddProductUseCase {
    
    private let repository: AddProductRepository

    public init(repository: AddProductRepository) {
        self.repository = repository
    }
    
    public func execute(_ product: ProductModel) {
        return repository.addProduct(product)
    }
    
}
