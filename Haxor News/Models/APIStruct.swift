//
//  apiStruct.swift
//  Haxor News
//
//  Created by user167809 on 4/13/20.
//  Copyright © 2020 user167809. All rights reserved.
//

import Foundation

struct APIStruct: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String{ //computed property, aby uzyskac zmienna ID z objectID ktora jest z danych API
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
