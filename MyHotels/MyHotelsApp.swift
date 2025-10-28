//
//  MyHotelsApp.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import SwiftUI

@main
struct MyHotelsApp: App {
    
    init () {
        Dependency.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            RootPage()
        }
    }
}
