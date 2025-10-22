//
//  StarRatingView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import SwiftUI

struct StarRatingView: View {
    let rating: Double
    private let maxStars = 5
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<maxStars, id: \.self) { index in
                let fill = starFill(for: index)
                Image(systemName: fill)
                    .imageScale(.small)
            }
            Text(String(format: "%.1f", rating))
                .font(.caption)
                .padding(.leading, 4)
        }
    }
    
    private func starFill(for index: Int) -> String {
        let value = rating - Double(index)
        if value >= 1 { return "star.fill" }
        else if value >= 0.5 { return "star.leadinghalf.filled" }
        else { return "star" }
    }
}
