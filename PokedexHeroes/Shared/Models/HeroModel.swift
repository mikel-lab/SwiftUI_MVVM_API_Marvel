//
//  HeroModel.swift
//  PokedexHeroes
//
//  Created by Mikel Cobian on 13/3/22.
//

import Foundation

struct MarvelModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataMarvel
}

// MARK: - DataClass
struct DataMarvel: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable , Identifiable{
    let id: Int
    let title:String? // optional para Series
    let name: String? // operional para heros
    let description: String? // Puede o no venir a vacio
    let thumbnail: Thumbnail
    let resourceURI: String? // Puede o no venir
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    
    // modificacion para cuando estemos diseñando la descarga de photos
   /* func getUrlImage(type:photoType = photoType.portrait) -> String {
        return "\(path)/\(type.rawValue).\(thumbnailExtension)"
    }*/
    
    func getUrlThumbnail() -> String {
        return "\(path).\(thumbnailExtension)"
    }
    
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}


//--- para cuando estemos diseñando la descarga de photos

enum photoType: String {
    case portrait = "portrait_xlarge"
    case landscape = "landscape_xlarge"
}
