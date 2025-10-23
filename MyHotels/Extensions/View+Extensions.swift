//
//  View+Extensions.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import SwiftUI

extension View {
    func shimmer() -> some View {
        self
            .overlay(
                LinearGradient(gradient: Gradient(colors: [.clear, .white.opacity(0.35), .clear]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .blendMode(.plusLighter)
                .rotationEffect(.degrees(20))
                .offset(x: -200)
                .mask(self)
                .animation(.linear(duration: 1.2).repeatForever(autoreverses: false), value: UUID())
            )
    }
}

extension View {
    func appTopBar(_ config: TopBarConfig) -> some View {
        modifier(AppTopBarModifier(config: config))
    }

    func appTopBar(
        title: String,
        balance: Decimal,
        locationName: String = "Hyderabad",
        locationSymbol: String = "mappin.and.ellipse",
        onLocationTap: @escaping () -> Void = {},
        onWallet: @escaping () -> Void
    ) -> some View {
        appTopBar(TopBarConfig(
            title: title,
            balance: balance,
            locationName: locationName,
            onLocationTap: onLocationTap,
            onWallet: onWallet,
            locationSymbol: locationSymbol
        ))
    }
}

