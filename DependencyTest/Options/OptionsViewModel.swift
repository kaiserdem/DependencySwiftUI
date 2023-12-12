//
//  OptionsViewModel.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//


import Combine
import Dependency

class OptionsViewModel: ObservableObject {
    
    @Dependency(\.productDataService) var productDataService
    
    var productsPublisher: Published<[Product]>.Publisher? { $products }

    @Published var products: [Product] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        print("___ init OptionsViewModel")
        addSubscribers()
    }
    
    func addSubscribers() {
        productDataService.productsPublisher?
            .sink { [weak self] newProducts in
                guard let self = self else { return }
                self.products = newProducts
            }
            .store(in: &cancellables)
        
    
//        $products
//            .combineLatest(productDataService.productsPublisher)
//            .sink {  [weak self] newProducts in
//                guard let self = self else { return }
//                self.products = newProducts.1
//            }
//            .store(in: &cancellables)
    }
    
    func addProduct() {
        productDataService.addProduct(ProductModel(name: "Apple",
                                                      calories: 999.0,
                                                      weight: 999.0))
    }
    
}
