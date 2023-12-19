//
//  ContentView.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import SwiftUI

struct ProductsView: View {
        
    @EnvironmentObject private var viewModel: ProductViewModel

    @State var introStack = NavigationPath()

    var body: some View {
        NavigationStack(path: $introStack) {
            VStack {
                Text("Products screen")
                    .font(.title)
                
                Spacer()
                Button("Add product") {
                    viewModel.addProduct()
                }
                .foregroundColor(.blue)
                .padding(20)
                .buttonStyle(.borderless)
                .frame(maxWidth: .infinity)
                .border(.gray)
                Spacer()
                List {
                    ForEach(viewModel.products) { product in
                        Text("\(product.name!)" + ", calories: \(product.calories)")
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                            .onTapGesture {
                                introStack.append("DetailScreen")
                            }
                    }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationDestination(for: String.self) { screen in
                switch screen {
                case "DetailScreen":
                    ProductDetailView()
                default:
                    Text("Error screen")
                }
            }
        }
    }
}
