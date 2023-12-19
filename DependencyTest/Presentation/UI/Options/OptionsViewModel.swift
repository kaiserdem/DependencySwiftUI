//
//  OptionsViewModel.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//


import Combine
import Dependency

class OptionsViewModel: ObservableObject {
    
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
    
    func addSubscribers() {
        getProductsUseCase.execute()?
            .sink { [weak self] newProducts in
                guard let self = self else { return }
                self.products = newProducts
            }
            .store(in: &cancellables)
    }
    
    func addProduct() {
        addProductUseCase.execute(ProductModel(name: "Apple \(String(products.count + 1))",
                                               calories: Double.random0to1(),
                                               weight: 999.0))
    }
}
