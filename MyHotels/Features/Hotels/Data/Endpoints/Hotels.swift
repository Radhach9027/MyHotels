//
//  FetchHotels.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 29/10/25.
//

import Foundation
import NetworkClient

enum Hotels {
    case fetch
}

extension Hotel: NetworkRequestProtocol {
    
    var httpMethod: NetworkRequestMethod {
        .get
    }
    
    var urlComponents: URLComponents? {
        URLComponents(string: "https://my-json-server.typicode.com/typicode/demo/posts")
    }
}


