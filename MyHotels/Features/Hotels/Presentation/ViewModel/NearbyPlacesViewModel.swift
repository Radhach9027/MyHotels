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
    @Inject private var getNearby: GetNearbyPlacesUseCase
    @Published private(set) var state: LoadState<[Place]> = .idle
    var statePublisher: Published<LoadState<[Place]>>.Publisher { $state }
    var currentLocation = CLLocation(latitude: 17.4474, longitude: 78.3762)

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

    func placesSorted(_ items: [Place]) -> [Place] {
        items.sorted {
            CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
                .distance(from: currentLocation)
            <
            CLLocation(latitude: $1.coordinate.latitude, longitude: $1.coordinate.longitude)
                .distance(from: currentLocation)
        }
    }
    
    func distanceString(from a: CLLocation, to b: CLLocation) -> String {
        let meters = a.distance(from: b)
        if meters < 1000 {
            return "\(Int(meters)) m"
        } else {
            let km = meters / 1000.0
            return String(format: "%.1f km", km)
        }
    }
}

