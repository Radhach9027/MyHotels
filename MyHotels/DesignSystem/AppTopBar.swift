//
//  AppTopBar.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 23/10/25.
//

import SwiftUI

public struct TopBarConfig {
    public var title: String
    public var balance: Decimal
    public var locationName: String
    public var onLocationTap: () -> Void
    public var onWallet: () -> Void
    public var locationSymbol: String

    public init(
        title: String,
        balance: Decimal,
        locationName: String,
        onLocationTap: @escaping () -> Void,
        onWallet: @escaping () -> Void,
        locationSymbol: String
    ) {
        self.title = title
        self.balance = balance
        self.locationName = locationName
        self.onLocationTap = onLocationTap
        self.onWallet = onWallet
        self.locationSymbol = locationSymbol
    }
}

private struct AppTopBarToolbar: ToolbarContent {
    let config: TopBarConfig

    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: config.onLocationTap) {
                VStack(spacing: 2) {
                    Image(systemName: config.locationSymbol)
                        .font(.system(size: 14, weight: .semibold))
                    Text(config.locationName)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .fixedSize(horizontal: true, vertical: false)
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(.bottom, 4)
                }
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Location \(config.locationName)")
        }

        ToolbarItem(placement: .principal) {
            Text(config.title).font(.headline.bold())
        }

        ToolbarItem(placement: .topBarTrailing) {
            Button(action: config.onWallet) {
                BalancePill(amount: config.balance)
            }
            .buttonStyle(.plain)
            .accessibilityHint("Opens wallet")
        }
    }
}

struct AppTopBarModifier: ViewModifier {
    let config: TopBarConfig

    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { AppTopBarToolbar(config: config) }
            .toolbarBackground(Color(.systemBackground), for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
    }
}
