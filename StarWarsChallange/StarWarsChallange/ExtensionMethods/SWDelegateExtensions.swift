//
//  SWDelegateExtensions.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 29/01/22.
//

import Foundation
import UIKit

extension SWCharactersViewController: StarWarsViewModelDelegate {
    func fetchDidSucceed() {
        // Reload table view with fetched characters
        StarWarsCollection.reloadData()

    }
    
    func fetchDidFail(with title: String, description: String) {
        //TODO
    }
}


