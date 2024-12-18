//
//  FavoriteLocalDatasource.swift
//  idealistaChallenge
//
//  Created by diegitsen on 18/12/24.
//

import Foundation

class FavoriteLocalDatasource {
    
    func saveFavorite(propertyId: String, date: String) async {
        _ = FavoriteEntity.fetchSingleOrCreate(date: date, propertyId: propertyId)
        await PersistenceManager.shared.save()
    }
    
    func getFavorites() -> [FavoriteEntity] {
        let favorites = PersistenceManager.shared.fetch(FavoriteEntity.self)
        return favorites
    }
    
    func getFavorite(favoriteId: String) -> FavoriteEntity? {
        let favorite = PersistenceManager.shared.fetchSingle(FavoriteEntity.self, id: favoriteId)
        return favorite
    }
}
