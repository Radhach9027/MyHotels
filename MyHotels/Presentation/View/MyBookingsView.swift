//
//  MyBookingsView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 23/10/25.
//

import SwiftUI

struct MyBookingsView: View {
    var body: some View {
        List {
            ForEach(0..<10, id: \.self) { i in
                Text("Upcoming booking #\(i + 1)")
            }
        }
    }
}
