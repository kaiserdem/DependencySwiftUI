//
//  OptionView.swift
//  DependencyTest
//
//  Created by kaiserdem  on 11.12.2023.
//

import SwiftUI

struct OptionView: View {
    
    @EnvironmentObject private var vm: OptionsViewModel

    var body: some View {
        VStack {
            Text("Option screen")
                .font(.title)
            List {
                ForEach(vm.products) { prod in
                    Text(prod.name ?? "")
                }
            }
            .listStyle(PlainListStyle())
            Spacer()
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
    }
}
