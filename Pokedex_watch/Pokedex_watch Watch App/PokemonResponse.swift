//
//  PokemonResponse.swift
//  Pokedex_watch Watch App
//
//  Created by Zahid Laguna on 1/8/23.
//

import Foundation

struct PokemonResponse: Codable, Identifiable{
    var id: String{UUID().uuidString}
    
    let results: [Pokemon]
    
}

struct Pokemon: Codable, Identifiable{
    var id: String {UUID().uuidString}
    let name: String
    let url: URL
}
