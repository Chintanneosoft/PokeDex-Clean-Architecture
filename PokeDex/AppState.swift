//
//  ViewModel.swift
//  PokeDex
//
//  Created by Neosoft on 29/11/23.
//

import Foundation

// AppState.swift

class AppState : ObservableObject, Identifiable{
    @Published var pokemons: [Pokemon] = []
    @Published var pokemonDetails: [PokemonDetails] = []
}
