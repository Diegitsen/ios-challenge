//
//  FavoritesViewModel.swift
//  idealistaChallenge
//
//  Created by diegitsen on 18/12/24.
//

import Foundation

class FavoritesViewModel {
    
    let propertyRepository = PropertyRepository()
    let favoritesRepository = FavoriteRepository()
    var favorites = Observable<[FavoriteEntity]>()
    var properties: [PropertyEntity] = []
    
    func getFavorites() {
        self.properties = propertyRepository.getLocalProperties()
        self.favorites.value = favoritesRepository.getFavorites()
    }
    
}
