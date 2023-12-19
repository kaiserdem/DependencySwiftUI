//
//  ProductDataService.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import Combine
import CoreData

class ProductDataService: ProductDataServiceProtocol {
    
    private let container: NSPersistentContainer
    private let containerName: String = "ProductsConteiner"
    private let paroductsEntityName: String = "Product"
    
    var productsPublisher: Published<[Product]>.Publisher? { $products }
    @Published var products: [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
        
    init() {
        print("___ init ProductDataService")

        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            
            self.getProducts()
        }
    }
    
    private func getProducts() {
        let request = NSFetchRequest<Product>(entityName: paroductsEntityName)
        
        do {
            products = try container.viewContext.fetch(request)

        } catch let error {
            print("Error fetching my products Entities. \(error)")
        }
    }
    
    func addProduct(_ product: ProductModel) {
        add(prodyct: product)
    }
    
    private func add(prodyct: ProductModel) {
        let entity = Product(context: container.viewContext)
        entity.name = prodyct.name
        entity.calories = prodyct.calories
        entity.weight = prodyct.weight
        applyChanges()
    }
   
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getProducts()

    }
}
