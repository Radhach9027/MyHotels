//
//  MyPassView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 23/10/25.
//

import SwiftUI

struct MyPassPage: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "qrcode.viewfinder")
                .font(.system(size: 64, weight: .regular))
            Text("Your travel passes appear here")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
    }
}
