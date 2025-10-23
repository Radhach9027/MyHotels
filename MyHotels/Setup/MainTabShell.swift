//
//  MainTabShell.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 23/10/25.
//

import SwiftUI

enum MainTab: String, CaseIterable, Hashable {
    case hotels, booking, pass, profile
}

extension MainTab {
    var id: String { rawValue }

    var title: String {
        switch self {
        case .hotels:  return "Hotels"
        case .booking: return "Bookings"
        case .pass:    return "My Pass"
        case .profile: return "Profile"
        }
    }

    var systemImage: String {
        switch self {
        case .hotels:  return "bed.double.fill"
        case .booking: return "calendar.badge.clock"
        case .pass:    return "ticket.fill"
        case .profile: return "person.fill"
        }
    }

    @ViewBuilder
    func contentView() -> some View {
        switch self {
        case .hotels:  HomeView()
        case .booking: MyBookingsView()
        case .pass:    MyPassView()
        case .profile: ProfileView()
        }
    }
}

struct MainTabShell: View {
    @State private var selection: MainTab = .hotels
    @State private var balance: Decimal = 12345.67
    @State private var locationName: String = "Hyderabad"

    var body: some View {
        AppTabBar(
            selection: $selection,
            balance: balance,
            locationName: locationName,
            onLocationTap: { },
            onWallet: {}
        )
    }
}
