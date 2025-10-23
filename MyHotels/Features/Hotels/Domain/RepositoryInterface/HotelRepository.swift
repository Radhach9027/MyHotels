//
//  HotelRepository.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation

protocol HotelRepository {
    func topHotels() async throws -> [Hotel]
}
