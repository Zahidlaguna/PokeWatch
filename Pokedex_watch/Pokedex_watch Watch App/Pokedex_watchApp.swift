//
//  Pokedex_watchApp.swift
//  Pokedex_watch Watch App
//
//  Created by Zahid Laguna on 1/8/23.
//

import SwiftUI

@main
struct Pokedex_watch_Watch_AppApp: App {
    
    @StateObject var model = PokeDexVM()
    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
}
