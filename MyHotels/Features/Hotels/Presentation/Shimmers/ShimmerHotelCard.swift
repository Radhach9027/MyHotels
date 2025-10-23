//
//  ShimmerHotelCard.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import SwiftUI

struct ShimmerHotelCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color(.secondarySystemBackground))
            .frame(width: 280, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 18).stroke(Color.primary.opacity(0.06))
            )
            .redacted(reason: .placeholder)
            .shimmer()
    }
}
