//
//  ContentView.swift
//  Assignment 23
//
//  Created by Gega on 5/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CatFactViewModel()

    var body: some View {
        NavigationView {
            List {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                } else {
                    ForEach(viewModel.catFacts) { fact in
                        Text(fact.fact).padding()
                    }
                }
            }
            .navigationTitle("Cat Facts")
            .onAppear {
                viewModel.fetchFacts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
