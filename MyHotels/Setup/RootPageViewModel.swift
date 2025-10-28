//
//  RootPageViewModel.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 28/10/25.
//
import Combine
import Foundation

class RootPageViewModel: ObservableObject {
    @Published var selection: MainTab = .hotels
    @Published var balance: Decimal = 12345.67
    @Published var locationName: String = "Hyderabad"
}
