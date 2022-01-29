//
//  ViewController.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 28/01/22.
//

import UIKit


class SWCharactersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate  {
    
    private var viewModel: StarWarsViewModel?
    
    @IBOutlet weak var StarWarsCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  0 //TODO
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellIcon", for: indexPath) as! CharactersCell
    
        //Customize cell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black
            .cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        cell.layer.shadowRadius = 4.0
   
        
        cell.Nome.text = viewModel?.findPerson(at: indexPath.row).name
        
        return cell
        
        
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

