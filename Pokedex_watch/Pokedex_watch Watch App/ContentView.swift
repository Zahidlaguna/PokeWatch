//
//  ContentView.swift
//  Pokedex_watch Watch App
//
//  Created by Zahid Laguna on 1/8/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: PokeDexVM
    var body: some View {
        List(model.pokemon){ pokemon in
            Text(pokemon.name)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(model: PokeDexVM())
        }
    }
}
