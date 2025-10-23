//
//  GetTopHotelsUseCase.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import DependencyContainer

struct GetTopHotelsUseCase {
   @Inject private var repo: HotelRepository
    
    func execute() async throws -> [Hotel] {
        try await repo.topHotels()
    }
}
