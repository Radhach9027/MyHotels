//
//  NearbyPlacesViewModel.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import CoreLocation
import Combine
import DependencyContainer

@MainActor
final class NearbyPlacesViewModel: ObservableObject {
    @Published private(set) var state: LoadState<[Place]> = .idle
    @Inject private var getNearby: GetNearbyPlacesUseCase
    
    func load(from here: CLLocation) {
        state = .loading
        Task {
            do {
                let places = try await getNearby.execute(from: here)
                state = .loaded(places)
            } catch {
                state = .failed(error)
            }
        }
    }
}
