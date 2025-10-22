//
//  LoadState.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation

enum LoadState<Value> {
    case idle
    case loading
    case loaded(Value)
    case failed(Error)
}

extension LoadState {
    var value: Value? {
        if case .loaded(let v) = self { return v }
        return nil
    }
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
}
