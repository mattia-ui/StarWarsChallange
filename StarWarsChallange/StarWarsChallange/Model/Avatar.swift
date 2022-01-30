//
//  Avatr.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 30/01/22.
//

import UIKit
import Foundation

struct Avatar: Codable {
    let image: UIImage
    
    enum CodingKeys: String, CodingKey {
        case image
    }

    init(image: UIImage) {
        self.image = image
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let data = try values.decode(Data.self, forKey: .image)
                guard let image = UIImage(data: data) else {
                    throw DecodingError.dataCorruptedError(forKey: .image, in: values, debugDescription: "Invalid image data")
                }
        self.image = image
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(image.pngData(), forKey: .image)
    }

}
    



