//
//  StarWarsViewModel.swift
//  StarWarsChallange
//
//  Created by Mattia Cardone on 28/01/22.
//

import Foundation

protocol StarWarsViewModelDelegate: AnyObject {
    //Todo da implementare
    func fetchDidSucceed()
    func fetchDidFail(with title: String, description: String)
}

class StarWarsViewModel {
    
    var apiClient = APIClient()
    var avatarClient = APIAvatarClient()
    
    private weak var delegate: StarWarsViewModelDelegate?
    
    init(delegate: StarWarsViewModelDelegate) {
        self.delegate = delegate
    }
    private var vehicles: [Vehicle] = []
    private var films: [Film] = []
    
    var starWarsPeople: [Person] = [] {
        didSet {
            //Index outOfRange
            if currentCount < totalCount {
                fetchPeople()
            } else {
                
                //self.starWarsPeople.sort { $0.name < $1.name }
                self.delegate?.fetchDidSucceed()
            }
        }
    }
    
    //Avatar section
    var avatar: [Avatar] = []{
        didSet {
            //Index outOfRange
            if currentAvatarCount < totalAvatarCount {
                fetchAvatar()
            } else {
                
                //self.avatar.sort { $0.name < $1.name }
                self.delegate?.fetchDidSucceed()
            }
        }
    }
    var totalAvatarCount: Int {return total}
    var currentAvatarCount: Int { return avatar.count }
    
    private var currentPage = 1
    private var total = 0
    
    //Characters section
    var totalCount: Int { return total }
    var currentCount: Int { return starWarsPeople.count }

    func findPerson(at index: Int) -> Person {
        return starWarsPeople[index]
    }
    
    func findAvatar(at index: Int) -> Avatar {
        return avatar[index]
    }
    
    func findFilm(at index: Int) -> [Film] {
        return films
    }
    
    func findVehicles(at index: Int) -> [Vehicle] {
        return vehicles
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
    
    func fetchAvatar() {
        avatarClient.fetch(with: nil, page: currentPage, dataType: RootAvatarResponse.self) { result in
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
                    self.avatar.append(contentsOf: response.results)
                    self.delegate?.fetchDidSucceed()
                }
            }
        }
    }
    
    func fetchFilm(with url: URL) {
        apiClient.fetch(with: url, page: nil, dataType: Film.self) { result in
            switch result {
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self.delegate?.fetchDidFail(with: error.reason, description: error.localizedDescription)
                }
            case .success(let film):
                
                DispatchQueue.main.async {
                    self.films.append(film)
                    self.delegate?.fetchDidSucceed()
                }
            }
        }
    }
    
    //Todo fetch Vehicles
    func fetchVehicles(with url: URL) {
        apiClient.fetch(with: url, page: nil, dataType: Vehicle.self) { result in
            switch result {
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self.delegate?.fetchDidFail(with: error.reason, description: error.localizedDescription)
                }
            case .success(let vehicle):
                
                DispatchQueue.main.async {
                    self.vehicles.append(vehicle)
                    self.delegate?.fetchDidSucceed()
                }
            }
        }
    }
    
}
