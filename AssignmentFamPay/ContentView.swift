//
//  ContentView.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CardGroupsViewModel()
    @State private var showErrorAlert = false

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if viewModel.error != nil {
                    Text("Error")
                        .foregroundColor(.red)
                    Text(viewModel.error?.localizedDescription ?? "Unknown error")
                        .foregroundColor(.red)
                        .onAppear {
                            showErrorAlert = true
                        }
                        .alert(isPresented: $showErrorAlert) {
                            Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? "Unknown error"))
                        }
                } else {
                    List {
                        ForEach(viewModel.cardGroups) { cardGroup in
                            CardGroupView(cardGroup: cardGroup)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .onAppear {
                        viewModel.fetchData()
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
