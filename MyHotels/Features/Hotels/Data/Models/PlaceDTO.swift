//
//  PlaceDTO.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation

struct PlaceDTO: Decodable {
    let id: String
    let name: String
    let category: String
    let lat: Double
    let lon: Double
    let imageURL: String?
    let rating: Double
    let reviews: Int
    let summary: String
}
