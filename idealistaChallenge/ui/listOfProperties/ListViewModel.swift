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
    
    func getListOfProperties() async {
        await propertyRepository.getListOfProperties(onRepositoryDataCallback: { propertyServiceResponse in
            guard let propertiesData = propertyServiceResponse.listOfProperties else {
                return
            }
            favorites = favoritesRepository.getFavorites()
            properties.value = propertiesData
            print("hey! AAAAA favorites: \(favorites.count)")
        })
    }
    
    func saveFavorite(property: PropertyEntity) async {
        let date = Date().toString()
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
