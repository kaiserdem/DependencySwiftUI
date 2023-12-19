//
//  CurrentViewModel.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import Combine
import Dependency

class ProductViewModel: ObservableObject {
    
    private let getProductsUseCase: GetProductsUseCase
    private let addProductUseCase: AddProductUseCase

    var productsPublisher: Published<[Product]>.Publisher? { $products }
    @Published var products: [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(_ getProductsUseCase: GetProductsUseCase, _ addProductUseCase: AddProductUseCase) {
        self.getProductsUseCase = getProductsUseCase
        self.addProductUseCase = addProductUseCase
        
        addSubscribers()
        
        print("___ init ProductViewModel")
    }

    func addSubscribers()  ->  [Product] {
        var p:  [Product] = []
        getProductsUseCase.execute()?
            .sink { [weak self] newProducts in
                guard let self = self else { return }
                print("products: \(newProducts.count)")
                self.products = newProducts
                p = newProducts
            }
            .store(in: &cancellables)
        return p
    }
    
    func addProduct() {
        addProductUseCase.execute(ProductModel(name: "Apple \(String(products.count + 1))",
                                               calories: Double.random0to1(),
                                               weight: 999.0))
    }
    
}
