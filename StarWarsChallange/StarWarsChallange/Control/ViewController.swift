//
//  ViewController.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 28/01/22.
//

import UIKit

struct Personaggi : Codable {
    
    let Nome: String
    let Avatar: String
    
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate  {
    
    var arrayIcons = [Personaggi(Nome: "", Avatar: "")]
    
    @IBOutlet weak var StarWarsCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = view.frame.size.height
        let width = view.frame.size.width
     
        return CGSize(width: width, height: height )

        }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

