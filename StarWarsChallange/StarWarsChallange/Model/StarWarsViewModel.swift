//
//  StarWarsViewModel.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 28/01/22.
//

import Foundation

protocol StarWarsViewModelDelegate: AnyObject {
    func fetchDidSucceed()
    func fetchDidFail(with title: String, description: String)
}

class StarWarsViewModel {
    
    var apiClient = APIClient()
    
    private weak var delegate: StarWarsViewModelDelegate?
    
    init(delegate: StarWarsViewModelDelegate) {
        self.delegate = delegate
    }
    
    private var films: [Film] = []
    private var starWarsPeople: [Person] = []
    private var currentPage = 1
    private var total = 0
    
    func findPerson(at index: Int) -> Person {
        return starWarsPeople[index]
    }
    
    
    func fetchPeople() {
        apiClient.fetch(with: nil, page: currentPage, dataType: RootResponse.self) { result in
            switch result {
            case .failure(let error):
                // Perform on main thread to update UI
                DispatchQueue.main.async {
                    self.delegate?.fetchDidFail(with: error.reason, description: error.localizedDescription)
                }
            case .success(let response):
                // Perform on main thread to update UI
                DispatchQueue.main.async {
                    // Store total number of characters available on the server
                    self.total = response.count
                    
                    // Increment the page number to fetch the next page of results
                    self.currentPage += 1
                    
                    // Store the latest fetched characters
                    self.starWarsPeople.append(contentsOf: response.results)
                    
                    self.delegate?.fetchDidSucceed()
                }
            }
        }
    }
    
    
}
