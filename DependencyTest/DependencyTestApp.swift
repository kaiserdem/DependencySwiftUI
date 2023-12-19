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
    
    var body: some Scene {
        WindowGroup {
            BaseView()
                .environmentObject(DependencyContainer())
        }
    }
}
