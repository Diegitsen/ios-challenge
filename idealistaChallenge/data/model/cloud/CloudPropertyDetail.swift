//
//  CloudPropertyDetail.swift
//  idealistaChallenge
//
//  Created by diegitsen on 17/12/24.
//

import Foundation

struct CloudPropertyDetail: Equatable {
    let id: Int
    let price: Double
    let priceInfo: Price
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: Multimedia
    let propertyComment: String
    let ubication: Ubication
    let country: String
    let moreCharacteristics: MoreCharacteristics
    let energyCertification: EnergyCertification

    init(json: Json) {
        id = json["adid"] as? Int ?? 0
        price = json["price"] as? Double ?? 0.0
        let priceJson = json["priceInfo"] as? Json ?? Json()
        priceInfo = Price(json: priceJson)
        operation = json["operation"] as? String ?? ""
        propertyType = json["propertyType"] as? String ?? ""
        extendedPropertyType = json["extendedPropertyType"] as? String ?? ""
        homeType = json["homeType"] as? String ?? ""
        state = json["state"] as? String ?? ""
        let multimediaJson = json["multimedia"] as? Json ?? Json()
        multimedia = Multimedia(json: multimediaJson)
        propertyComment = json["propertyComment"] as? String ?? ""
        let ubicationJson = json["ubication"] as? Json ?? Json()
        ubication = Ubication(json: ubicationJson)
        country = json["country"] as? String ?? ""
        let moreCharacteristicsJson = json["moreCharacteristics"] as? Json ?? Json()
        moreCharacteristics = MoreCharacteristics(json: moreCharacteristicsJson)
        let energyCertificationJson = json["energyCertification"] as? Json ?? Json()
        energyCertification = EnergyCertification(json: energyCertificationJson)
    }
}

// MARK: - Ubication
struct Ubication: Equatable {
    let latitude: Double
    let longitude: Double

    init(json: Json) {
        latitude = json["latitude"] as? Double ?? 0.0
        longitude = json["longitude"] as? Double ?? 0.0
    }
}

// MARK: - MoreCharacteristics
struct MoreCharacteristics: Equatable {
    let communityCosts: Int
    let roomNumber: Int
    let bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType: String
    let flatLocation: String
    let modificationDate: Int
    let constructedArea: Int
    let lift: Bool
    let boxroom: Bool
    let isDuplex: Bool
    let floor: String
    let status: String

    init(json: Json) {
        communityCosts = json["communityCosts"] as? Int ?? 0
        roomNumber = json["roomNumber"] as? Int ?? 0
        bathNumber = json["bathNumber"] as? Int ?? 0
        exterior = json["exterior"] as? Bool ?? false
        housingFurnitures = json["housingFurnitures"] as? String ?? ""
        agencyIsABank = json["agencyIsABank"] as? Bool ?? false
        energyCertificationType = json["energyCertificationType"] as? String ?? ""
        flatLocation = json["flatLocation"] as? String ?? ""
        modificationDate = json["modificationDate"] as? Int ?? 0
        constructedArea = json["constructedArea"] as? Int ?? 0
        lift = json["lift"] as? Bool ?? false
        boxroom = json["boxroom"] as? Bool ?? false
        isDuplex = json["isDuplex"] as? Bool ?? false
        floor = json["floor"] as? String ?? ""
        status = json["status"] as? String ?? ""
    }
}

// MARK: - EnergyCertification
struct EnergyCertification: Equatable {
    let title: String
    let energyConsumption: CertificationDetail
    let emissions: CertificationDetail

    init(json: Json) {
        title = json["title"] as? String ?? ""
        let consumptionJson = json["energyConsumption"] as? Json ?? Json()
        energyConsumption = CertificationDetail(json: consumptionJson)
        let emissionsJson = json["emissions"] as? Json ?? Json()
        emissions = CertificationDetail(json: emissionsJson)
    }
}

struct CertificationDetail: Equatable {
    let type: String

    init(json: Json) {
        type = json["type"] as? String ?? ""
    }
}
