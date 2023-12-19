//
//  BaseView.swift
//  DependencyTest
//
//  Created by kaiserdem  on 13.12.2023.
//

import SwiftUI

struct BaseView: View {
    
    @Dependency(\.features.contentFeature.getProductsUseCase) var getProductsUseCase
    @Dependency(\.features.contentFeature.addProductUseCase) var addProductUseCase

    var body: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "list.dash")
                }
                .environmentObject(ProductViewModel(getProductsUseCase, addProductUseCase))
            
            OptionView()
                .tabItem {
                    Label("Options", systemImage: "square.and.pencil")
                }
                .environmentObject(ProductViewModel(getProductsUseCase, addProductUseCase))
        }
    }
}

