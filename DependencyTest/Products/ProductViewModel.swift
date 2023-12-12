//
//  CurrentViewModel.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import Combine
import Dependency

class ProductViewModel: ObservableObject {
    
    @Dependency(\.productDataService) var productDataService
    
    var productsPublisher: Published<[Product]>.Publisher? { $products }
    @Published var products: [Product] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        print("___ init ProductViewModel")
        addSubscribers()
    }
    
    func addSubscribers() {
        productDataService.productsPublisher?
            .sink { [weak self] newProducts in
                guard let self = self else { return }
                self.products = newProducts
            }
            .store(in: &cancellables)
    }
    
    func addProduct() {        
        productDataService.addProduct(ProductModel(name: "Apple\(String(products.count + 1))",
                                                   calories: Double.random0to1(),
                                                   weight: 999.0))
    }
    
}
