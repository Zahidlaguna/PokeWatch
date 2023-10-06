//
//  PokeDexVM.swift
//  Pokedex_watch Watch App
//
//  Created by Zahid Laguna on 1/9/23.
//
import Combine
import Foundation

final class PokeDexVM: ObservableObject {
    @Published var pokemon: [Pokemon] = []
    @Published var errorMessage: String = ""
    init () {
        Task { await pokemon() }
    }
    
    @MainActor func pokemon() async {
        do {
            pokemon = try await service.pokemon()
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
        }
    }
    
    private let service = PokeAPIService()
}
