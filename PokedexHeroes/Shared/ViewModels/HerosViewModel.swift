//
//  HerosViewModel.swift
//  PokedexHeroes
//
//  Created by Mikel Cobian on 13/3/22.
//

import Foundation
import Combine
import SwiftUI

final class viewModelHeros: ObservableObject {
    @Published var heros : MarvelModel?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing:Bool = false){
        if (testing){
            getHerosUIDesing()
        } else {
            getHeros()
        }
    }
    
    
    
    func getHeros(){
    
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeros())
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                          //valido si a fallado para lanzar ERROR
                          throw URLError(.badServerResponse)
                      }
                
                return $0.data
            }
            //.decode(type: [Result].self, decoder: JSONDecoder())
            .decode(type: MarvelModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    self.status = .loaded
                case .failure:
                    self.status = .error(error: "Error buscando los Heroes")
                }
            } receiveValue: { data in
                self.heros = data
            }
            .store(in: &suscriptors)

        
    }
    
    func getHeroUIDesing() -> Result {
        return Result(id: 1017100,
                      title: "",
                      name: "A-Bomb (HAS)",
                      description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!",
                      thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg),
                      resourceURI: "http://gateway.marvel.com/v1/public/characters/1017100")
    }
    
   func getHerosUIDesing() {
       
       let hero1 = Result(id: 1011334,
                          title: "",
                          name: "3-D Man",
                          description: "",
                          thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg),
                          resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334")
       
      let hero2 = Result(id: 1017100,
                          title: "",
                          name: "A-Bomb (HAS)",
                          description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!",
                          thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg),
                          resourceURI: "http://gateway.marvel.com/v1/public/characters/1017100")
       
      let hero3 = Result(id: 1009144,
                          title: "",
                          name: "A.I.M.",
                          description: "AIM is a terrorist organization bent on destroying the world.",
                          thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", thumbnailExtension: Extension.jpg),
                          resourceURI: "http://gateway.marvel.com/v1/public/characters/1009144")
       
       let data = DataMarvel(offset: 0, limit: 0, total: 3, count: 3, results: [hero1, hero2,hero3])
       
       self.heros = MarvelModel(code: 200, status: "success", copyright: "2020", attributionText: "", attributionHTML: "", etag: "", data: data)
    }
}
