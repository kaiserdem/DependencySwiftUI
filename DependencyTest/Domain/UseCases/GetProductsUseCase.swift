//
//  UseCases.swift
//  DependencyTest
//
//  Created by kaiserdem  on 12.12.2023.
//

import Foundation

class GetProductsUseCase {
    
    private let repository: GetProductsRepository

    public init(repository: GetProductsRepository) {
        self.repository = repository
    }
    
    public func execute() -> Published<[Product]>.Publisher? {
        return repository.getProducts()
    }
    
}
