//
//  HotelsViewModel.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import Combine
import DependencyContainer

@MainActor
final class HotelsViewModel: ObservableObject {
    @Published private(set) var state: LoadState<[Hotel]> = .idle
    @Inject private var getTopHotels: GetTopHotelsUseCase
    
    func load() {
        state = .loading
        Task {
            do {
                let hotels = try await getTopHotels.execute()
                state = .loaded(hotels)
            } catch {
                state = .failed(error)
            }
        }
    }
}
