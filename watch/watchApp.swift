//
//  Connectivity.swift
//  watch
//
//  Created by Cristian Ceban on 02.03.2024.
//

import SwiftUI


struct ContentView: View {
  @ObservedObject var connectivity  = Connectivity.shared
  
    var body: some View {
      Text("Hello from Expo! your text is: \(connectivity.text ?? "")")
    }
}

@main
struct watchApp: App {
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
