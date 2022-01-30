//
//  CharactersCell.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 28/01/22.
//

import UIKit

class CharactersCell: UICollectionViewCell {
    
    @IBOutlet weak var Avatar: UIImageView!
    @IBOutlet weak var Nome: UILabel!
    
    var person: Person! {
        didSet {
            Nome?.text = person.name
        }
    
    }
    
    var avatar: Avatar! {
        didSet {
            Avatar?.image = avatar.image
        }
    
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
