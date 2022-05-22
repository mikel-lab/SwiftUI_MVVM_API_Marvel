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
let apikey = publicKey
let hash = "e840a33b1efa5d31e5b60c38a8854cf7"

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
  
}


struct BaseNetwork {
    
    
    func getSessionHeros() -> URLRequest{
        let urlCad :  String = "\(server)\(endpoints.heroList.rawValue)?apikey=\(apikey)&ts=\(ts)&hash=\(hash)"
        //Creamos la Request
        var request =  URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
    
    func getSessionHerosDetail(idHero:Int) -> URLRequest{
        //TODO configurar la llamada API de detalle de postman
        let urlCad :  String = "\(server)\(endpoints.heroList.rawValue)/\(idHero)/series?apikey=\(apikey)&ts=\(ts)&hash=\(hash)"
        //Creamos la Request
        var request =  URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
    
    
}
