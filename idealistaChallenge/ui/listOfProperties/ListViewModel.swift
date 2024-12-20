//
//  ListViewModel.swift
//  idealistaChallenge
//
//  Created by diegitsen on 15/12/24.
//

import Foundation

class ListViewModel {
    
    let propertyRepository = PropertyRepository()
    let favoritesRepository = FavoriteRepository()
    var properties = Observable<[PropertyEntity]>()
    var favorites: [FavoriteEntity] = []
    var propertiesNotFiltered: [PropertyEntity] = []
    
    func getListOfProperties() async {
        await propertyRepository.getListOfProperties(onRepositoryDataCallback: { propertyServiceResponse in
            guard let propertiesData = propertyServiceResponse.listOfProperties else {
                return
            }
            favorites = favoritesRepository.getFavorites()
            propertiesNotFiltered = propertiesData
            properties.value = propertiesData
            print("hey! AAAAA favorites: \(favorites.count)")
        })
    }
    
    func getListOfProperties(sortOption: SortOption) {
        var propertiesToProcess = propertiesNotFiltered
        switch sortOption {
        case .HighestPrice:
            propertiesToProcess = propertiesToProcess.sorted(by: { $0.price > $1.price })
        case .LowestPrice:
            propertiesToProcess = propertiesToProcess.sorted(by: { $0.price < $1.price })
        case .FilterByRent:
            propertiesToProcess = propertiesToProcess.filter({ $0.operation == .rent })
        case .FilterBySale:
            propertiesToProcess = propertiesToProcess.filter({ $0.operation == .sale })
        }
        properties.value = propertiesToProcess
    }
    
    func saveFavorite(property: PropertyEntity) async {
        let date = Date().toStringDetailed()
        await favoritesRepository.saveFavorite(propertyId: property.id, date: date)
    }
    
    func setFavorite(property: PropertyEntity, isFavorite: Bool) async {
        if (isFavorite) {
            await saveFavorite(property: property)
        } else {
            guard let favorite = favoritesRepository.getFavorite(favoriteId: property.id) else {
                return
            }
            await PersistenceManager.shared.delete(favorite)
            await PersistenceManager.shared.save()
        }
    }
    
    
}
