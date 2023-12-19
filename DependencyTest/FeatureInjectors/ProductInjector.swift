//
//  ProductInjector.swift
//  DependencyTest
//
//  Created by kaiserdem  on 12.12.2023.
//

class ProductInjector {
    
    //MARK: - Datasources
    lazy var productDataService: ProductDataServiceProtocol = {
        ProductDataService()
    }()
    
    //MARK: - Repositories
    lazy var getProductsRepository: GetProductsRepository = {
        GetProductsRepositoryImplementation(service: productDataService as! ProductDataService)
    }()
    
    lazy var addProductRepository: AddProductRepository = {
        AddProductRepositoryImplementation(service: productDataService as! ProductDataService)
    }()
    
    
    //MARK: - UseCases
    lazy var getProductsUseCase: GetProductsUseCase = {
        GetProductsUseCase(repository: getProductsRepository)
    }()
    
    lazy var addProductUseCase: AddProductUseCase = {
        AddProductUseCase(repository: addProductRepository)
    }()
}
