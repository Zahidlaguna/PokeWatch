//
//  PokeAPIService.swift
//  Pokedex_watch Watch App
//
//  Created by Zahid Laguna on 1/8/23.
//

import Foundation

enum HTTPError: Error{
    case badResponse
}

final class PokeAPIService {
    func pokemon() async throws -> [Pokemon]{
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")!
        
        let (data, response) = try await URLSession.shared.data(from: <#T##URL#>)
        
       
        
        guard let httpResponse = response as? HTTPURLResponse else{
            throw HTTPError.badResponse
        }
        
        switch httpResponse.statusCode{
        case 200...299:
            do{
                let decodedResponse = try JSONDecoder().decode(PokemonResponse.self, from: <#T##Data#>)
                return decodedResponse.results
            } catch{
                throw error
            }
        default:
            throw HTTPError.badResponse
        }
    }
}


/*
import Foundation
import Combine

enum HTTPError: Error{
    case badResponse
}

final class PokeAPIService {
    func pokemon() async -> [Pokemon]{
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")!
        
        let (data, response) = try await URLSession.shared.data(for: url).await()
        
        print(String(data: data, encoding: .utf8))
        
        guard let httpResponse = response as? HTTPURLResponse else{
            throw HTTPError.badResponse
        }
        
        switch httpResponse.statusCode{
        case 200...299:
            do{
                let decodedResponse = JSONDecoder().decode(PokemonResponse.self, from: data)
                return decodedResponse.results
            } catch{
                throw error
            }
        default:
            throw HTTPError.badResponse
        }
    }
}
*/
