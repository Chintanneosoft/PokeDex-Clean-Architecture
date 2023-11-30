//
//  Interactor.swift
//  PokeDex
//
//  Created by Neosoft on 29/11/23.
//

import Foundation
import Combine

class PokemonInteractor: ObservableObject {
    
    let repository = Repository()
    var appState: AppState
    var pokemons:[Pokemon] = []
    
    var cancellable1: AnyCancellable?
    var cancellable2: AnyCancellable?
    
    init(appState: AppState) {
        self.appState = appState
    }

    func fetchPokemon(limit: Int) {
    cancellable1 = repository.fetchPokemons(limit: limit)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { response in
//                DispatchQueue.main.async {
                self.pokemons = response.results
                DispatchQueue.main.async {
                    self.appState.pokemons = response.results 
                }
                print(response.count)
//                for i in self.pokemons{
//                   DispatchQueue.global().async {
//                    self.fetchPokemonDetails(url: URL(string: i.url) ?? URL(string: "")!)
//                    print(i.name)
//                }
//                }
                print(response.results.count)
            })
    }
    
    func fetchPokemonDetails(url: URL) {
        cancellable2 = repository.fetchPokemonDetails(url: url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { response in
                DispatchQueue.main.async {
                    self.appState.pokemonDetails.append(response)
                    
                    print(self.appState.pokemonDetails.count)
                }
            })
    }
}
