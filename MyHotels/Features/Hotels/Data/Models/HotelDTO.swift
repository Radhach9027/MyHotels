//
//  HotelDTO.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation

struct HotelDTO: Decodable {
    let id: String
    let name: String
    let city: String
    let imageURL: String?
    let desc: String
    let rating: Double
    let reviews: Int
    let price: Int
}
