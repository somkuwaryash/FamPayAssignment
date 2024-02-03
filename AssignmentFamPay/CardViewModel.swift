//
//  CardViewModel.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI
import Combine

class CardGroupsViewModel: ObservableObject {
    @Published var cardGroups: [CardGroup] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private var cancellables: Set<AnyCancellable> = []

    func fetchData() {
        guard let url = URL(string: "https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage") else {
            return
        }

        isLoading = true

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false

                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] apiResponse in
                self?.cardGroups = apiResponse.hc_groups
                print("Data received successfully: \(apiResponse.hc_groups)")
            })
            .store(in: &cancellables)
    }

}
