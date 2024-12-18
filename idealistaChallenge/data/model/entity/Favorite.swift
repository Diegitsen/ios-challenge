//
//  Favorite.swift
//  idealistaChallenge
//
//  Created by diegitsen on 18/12/24.
//

import Foundation
import CoreData

class FavoriteEntity: NSManagedObject, UniquedObject {
    // UniqueId
    @NSManaged var id: String
    
    // Object data
    @NSManaged var date: String
    @NSManaged var isActive: Bool
    @NSManaged var propertyId: String
}

extension FavoriteEntity {
    
    class func fetchSingleOrCreate(
        date: String,
        propertyId: String
    ) -> FavoriteEntity {
        let id = propertyId
        let favorite = PersistenceManager.shared.fetchSingleOrCreate(FavoriteEntity.self, id: id)
        
        favorite.propertyId = propertyId
        favorite.date = date
        favorite.isActive = true
    
        return favorite
    }
}
