//
//  FavoriteRepository.swift
//  idealistaChallenge
//
//  Created by diegitsen on 18/12/24.
//

import Foundation

class FavoriteRepository {
   
    private let localDatasource = FavoriteLocalDatasource()
    
    func saveFavorite(propertyId: String, date: String) async {
        await localDatasource.saveFavorite(
            propertyId: propertyId,
            date: date)
    }
    
    func getFavorites() -> [FavoriteEntity] {
        let allRegistersOfFavorites = localDatasource.getFavorites()
        let activeFavorites = allRegistersOfFavorites.filter({ $0.isActive })
        return activeFavorites
    }
    
    func getFavorite(favoriteId: String) -> FavoriteEntity? {
        return localDatasource.getFavorite(favoriteId: favoriteId)
    }
}
