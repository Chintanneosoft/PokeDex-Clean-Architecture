//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Neosoft on 29/11/23.
//

import Foundation

// MARK: - Pokemons
struct Pokemons: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
}

// MARK: - Result
struct Pokemon: Codable {
    let name: String
    let url: String
}

