//
//  DependencyTestApp.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import SwiftUI
import Foundation
import Combine
import Dependency

@main
struct DependencyTestApp: App {
    
    @StateObject private var productViewModel = ProductViewModel()
    @StateObject private var optionsViewModel = OptionsViewModel()

    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                ProductsView()
                    .tabItem {
                        Label("Products", systemImage: "list.dash")
                    }
                    .environmentObject(productViewModel)
                
                OptionView()
                    .tabItem {
                        Label("Options", systemImage: "square.and.pencil")
                    }
                    .environmentObject(optionsViewModel)

            }
        }
    }
}
