//
//  PropertyDetailViewModel.swift
//  idealistaChallenge
//
//  Created by diegitsen on 17/12/24.
//

import Foundation

class PropertyDetailViewModel {
    
    let propertyRepository = PropertyRepository()
    var propertyDetail = Observable<CloudPropertyDetail>()
    
    func getDetailOfProperty() async {
        await propertyRepository.getDetailOfProperty(onRepositoryDataCallback: { propertyDetailServiceResponse in
            propertyDetail.value = propertyDetailServiceResponse.propertyDetail
        })
    }
    
}
