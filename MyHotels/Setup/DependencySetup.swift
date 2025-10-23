//
//  DependencySetup.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import DependencyContainer
import NetworkClient

struct Dependency {
    
    static func setup() {
        DIContainer.shared.register(TraditionalNetworkProtocol.self, lifetime: .singleton) {
            TraditionalNetwork(config: .default())
        }
        DIContainer.shared.register(HotelRepository.self) {
            RemoteHotelRepository()
        }
        
        DIContainer.shared.register(GetTopHotelsUseCase.self) {
            GetTopHotelsUseCase()
        }
        
        DIContainer.shared.register(PlacesRepository.self) {
            RemotePlacesRepository()
        }
        
        DIContainer.shared.register(GetNearbyPlacesUseCase.self) {
            GetNearbyPlacesUseCase()
        }
    }
}
