//
//  HeroesDetailView.swift
//  PokedexHeroes (iOS)
//
//  Created by Mikel Cobian on 14/3/22.
//

import SwiftUI

struct HeroesDetailView: View {
    var hero: Result
       @StateObject private var viewModel = viewModelHeros()
       
       init(hero:Result) {
           self.hero = hero
       }
       var body: some View {
           
           //Hacemos llamada al endpoint que trae las series asociadas al heroe que hemos pasado
           //como parámetro en el constructor. De esta manera dejamos los datos en la variable(detailSeries)
           //de series del viewModel.
           
           let _ = viewModel.getHeroDetail(hero: hero.id)
           
        #if os(OSX)
           List{
                             // validamos si hay datos desempaquetamos los datos
                             if let data = viewModel.detailSeries?.data.results{
                                 ForEach(data){ serieModel in
                                     HeroesDetailRowView(serie: serieModel)
                                 }
                             }
                         }
                     #else
                         List{
                             // validamos si hay datos desempaquetamos los datos
                             if let data = viewModel.detailSeries?.data.results{
                                 ForEach(data){ serieModel in
                                     HeroesDetailRowView(serie: serieModel)
                                 }
                             }
                         }
                         .navigationBarTitle("Series \(hero.name!)")
                     #endif
}

/*struct HeroesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesDetailView()
    }*/
}
