//
//  GetNearbyPlacesUseCase.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import CoreLocation
import DependencyContainer

struct GetNearbyPlacesUseCase {
   @Inject private var repo: PlacesRepository
    
    func execute(from here: CLLocation, radiusMeters: Int = 2500) async throws -> [Place] {
        try await repo.nearbyPlaces(from: here, radiusMeters: radiusMeters)
    }
}
