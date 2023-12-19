//
//  DetailScreen.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject private var viewModel: ProductViewModel

    var body: some View {
        Text("Detail Screen!")
        Text("Amount: \(viewModel.products.count) Apples")
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
