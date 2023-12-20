//
//  OptionsViewModel.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//


import Combine

class OptionsViewModel: ObservableObject {
    
    private let getProductsUseCase: GetProductsUseCase
    
    var productsPublisher: Published<[Product]>.Publisher? { $products }
    @Published var products: [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(_ getProductsUseCase: GetProductsUseCase) {
        self.getProductsUseCase = getProductsUseCase
        
        addSubscribers()
        
        print("___ init OptionsViewModel")
    }
    
    func addSubscribers() {
        getProductsUseCase.execute()?
            .sink { [weak self] newProducts in
                guard let self = self else { return }
                self.products = newProducts
            }
            .store(in: &cancellables)
    }
    
}
