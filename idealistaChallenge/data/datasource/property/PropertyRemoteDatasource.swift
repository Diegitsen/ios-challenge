//
//  PropertyDatasource.swift
//  idealistaChallenge
//
//  Created by diegitsen on 15/12/24.
//

import Foundation

class PropertyRemoteDatasource {
    
    private let localDatasource = PropertyLocalDatasource()
    
    func getListOfProperties(onRemoteDataCallback: (PropertyServiceResponse) -> Void) async {
        do {
            
            let url = try IdealistaAPIEndpoint.getListOfProperties.fetchRequestURL()
            let fetchedData = try await HTTPSRequestManager.shared.fetch(url: url)
            
            let cloudProperties = fetchedData.map(CloudProperty.init(json:))
            var properties: [PropertyEntity] = []
            await cloudProperties.asyncForEach { cloudProperty in
                let property = await localDatasource.saveProperty(cloudProperty: cloudProperty)
                properties.append(property)
            }
            let propertyServiceResponse = PropertyServiceResponse(
                isSuccessful: true,
                errorCode: nil,
                listOfProperties: properties)
            onRemoteDataCallback(propertyServiceResponse)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    func getDetailOfProperty(onRemoteDataCallback: (PropertyDetailServiceResponse) -> Void) async {
        do {
            
            let url = try IdealistaAPIEndpoint.getDetailOfProperty.fetchRequestURL()
            let fetchedData = try await HTTPSRequestManager.shared.fetchSingle(url: url)
            
            let cloudPropertyDetail = CloudPropertyDetail(json: fetchedData)
           
            let propertyDetailServiceResponse = PropertyDetailServiceResponse(
                isSuccessful: true,
                errorCode: nil,
                propertyDetail: cloudPropertyDetail)
            onRemoteDataCallback(propertyDetailServiceResponse)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    

}

struct PropertyServiceResponse: Equatable {
    let isSuccessful: Bool
    let errorCode: Int?
    let listOfProperties: [PropertyEntity]?
}

struct PropertyDetailServiceResponse: Equatable {
    let isSuccessful: Bool
    let errorCode: Int?
    let propertyDetail: CloudPropertyDetail
}
