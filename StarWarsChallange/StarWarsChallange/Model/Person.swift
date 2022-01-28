//
//  Person.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 28/01/22.
//

import Foundation

struct Person: Codable {
    let name: String
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let height: String
    let mass: String
    let skinColor: String
    let films: [URL]
    let vehicles: [URL]
    
}
