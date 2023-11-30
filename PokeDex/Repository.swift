//
//  Repositry.swift
//  PokeDex
//
//  Created by Neosoft on 29/11/23.
//

import Foundation
import Combine

class Repository{
    
    func fetchPokemons(limit: Int) -> AnyPublisher<Pokemons, Error> {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: Pokemons.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonDetails(url: URL) -> AnyPublisher<PokemonDetails, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: PokemonDetails.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
