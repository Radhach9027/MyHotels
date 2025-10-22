//
//  DTOMapper.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import CoreLocation

enum DTOMapper {
    static func hotel(_ dto: HotelDTO) -> Hotel {
        Hotel(
            id: dto.id,
            name: dto.name,
            city: dto.city,
            imageURL: dto.imageURL.flatMap(URL.init),
            description: dto.desc,
            rating: dto.rating,
            reviewsCount: dto.reviews,
            pricePerNight: dto.price
        )
    }
    
    static func place(_ dto: PlaceDTO) -> Place {
        Place(
            id: dto.id,
            name: dto.name,
            category: dto.category,
            coordinate: .init(latitude: dto.lat, longitude: dto.lon),
            imageURL: dto.imageURL.flatMap(URL.init),
            rating: dto.rating,
            reviewsCount: dto.reviews,
            summary: dto.summary
        )
    }
}
