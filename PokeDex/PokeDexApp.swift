//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Neosoft on 29/11/23.
//
// PokeDexApp.swift
import SwiftUI

@main
struct PokeDexApp: App {
    @StateObject var appState = AppState()
    @StateObject var interactor: PokemonInteractor

    init() {
        let appState = AppState()
        _appState = StateObject(wrappedValue: appState)
        _interactor = StateObject(wrappedValue: PokemonInteractor(appState: appState))
    }

    var body: some Scene {
        WindowGroup {
            ContentView(appState: appState, interactor: interactor)
        }
    }
}
