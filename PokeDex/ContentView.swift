//
//  ContentView.swift
//  PokeDex
//
//  Created by Neosoft on 29/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppState
    
        var interactor: PokemonInteractor

        var body: some View {
            VStack{
                List(appState.pokemons, id: \.name) { pokemon in
                    HStack{
                        Text(pokemon.name)
//                        AsyncImage(url: URL(string: pokemon.sprites.frontDefault) ?? URL(string: "")!)
                    }
                }
            }
            .onAppear {
                interactor.fetchPokemon(limit: 50)
            }
        }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
