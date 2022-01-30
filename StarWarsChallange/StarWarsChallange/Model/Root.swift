//
//  Root.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 29/01/22.
//

import Foundation

struct RootResponse: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Person]
}

struct RootAvatarResponse: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Avatar]
}
