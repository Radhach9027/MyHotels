//
//  CustomTabBar.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 23/10/25.
//

import SwiftUI

struct TabSpec: Identifiable {
    let id: String
    let title: String
    let systemImage: String
    let build: () -> AnyView

    init<ID: CustomStringConvertible>(
        id: ID,
        title: String,
        systemImage: String,
        @ViewBuilder content: @escaping () -> some View
    ) {
        self.id = id.description
        self.title = title
        self.systemImage = systemImage
        self.build = { AnyView(content()) }
    }
}

private struct TabNavItem: View {
    let spec: TabSpec
    let balance: Decimal
    let onWallet: () -> Void

    var body: some View {
        NavigationStack {
            spec.build()
                .appTopBar(
                    title: spec.title,
                    balance: balance,
                    onWallet: onWallet
                )
        }
        .tabItem {
            Image(systemName: spec.systemImage)
            Text(spec.title)
        }
        .tag(spec.id)
    }
}


struct AppTabBar: View {
    @Binding var selection: MainTab
    let balance: Decimal
    let locationName: String
    let onLocationTap: () -> Void
    let onWallet: () -> Void

    var body: some View {
        TabView(selection: $selection) {
            ForEach(MainTab.allCases, id: \.self) { tab in
                NavigationStack {
                    tab.contentView()
                        .appTopBar(
                            title: tab.title,
                            balance: balance,
                            locationName: locationName,
                            onLocationTap: onLocationTap,
                            onWallet: onWallet
                        )
                }
                .tabItem { Image(systemName: tab.systemImage); Text(tab.title) }
                .tag(tab)
            }
        }
    }
}

