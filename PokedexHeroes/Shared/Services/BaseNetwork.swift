//
//  BaseNetwork.swift
//  PokedexHeroes (iOS)
//
//  Created by Mikel Cobian on 10/3/22.
//

import Foundation

let server = "https://gateway.marvel.com"
let privateKey = "ecf701eefbd402a623ed575b76a10c8d1b2b2d10"
let publicKey = "0e9907e2f4eca5a6bd9e2c673d30447d"
let ts = "1"
let apiKey = "developer.marvel.com"
let hash = "f3081703d232a77e32e0186a9e1e52ea"

struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

//endpoints
enum endpoints : String{
    case heroList = "/v1/public/characters"
    case heroDetail = "/v1/public/characters/{characterId}/series"
}


struct BaseNetwork {
    
    
    func getSessionHeros() -> URLRequest{
        let urlCad :  String = "\(server)\(endpoints.heroList.rawValue)?ts=\(ts)&apiKey=\(apiKey)&hash=\(hash)"
        //Creamos la Request
        var request =  URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    func getSessionHerosDetail() -> URLRequest{
        let urlCad :  String = "\(server)\(endpoints.heroList.rawValue)?ts=\(ts)&apiKey=\(apiKey)&hash=\(hash)"
        //Creamos la Request
        var request =  URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
   
        return request
    }
    
    
}
