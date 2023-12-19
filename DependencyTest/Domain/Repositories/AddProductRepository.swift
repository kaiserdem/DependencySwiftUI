//
//  AddProduct.swift
//  DependencyTest
//
//  Created by kaiserdem  on 13.12.2023.
//

import Foundation

protocol AddProductRepository {
    func addProduct(_ product: ProductModel)
}

class AddProductRepositoryImplementation: AddProductRepository {
    
    private let service: ProductDataService
    
    init(service: ProductDataService) {
        self.service = service
    }

    func addProduct(_ product: ProductModel) {
        return service.addProduct(product)
    }

}
