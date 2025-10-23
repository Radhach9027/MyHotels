//
//  ShimmerPlaceRow.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import SwiftUI

struct ShimmerPlaceRow: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color(.secondarySystemBackground))
            .frame(height: 210)
            .overlay(
                RoundedRectangle(cornerRadius: 18).stroke(Color.primary.opacity(0.06))
            )
            .redacted(reason: .placeholder)
            .shimmer()
    }
}
