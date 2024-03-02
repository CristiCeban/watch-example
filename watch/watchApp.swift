//
//  Connectivity.swift
//  watch
//
//  Created by Cristian Ceban on 02.03.2024.
//

import SwiftUI


struct ContentView: View {
  
  @AppStorage(ConnectivityUserInfoKey.text.rawValue)
  private var text: String?
  
    var body: some View {
        Text("Hello from Expo! your text is: \(text ?? "")")
    }
}

@main
struct watchApp: App {
  let connectivity = Connectivity.shared
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
