//
//  HeroesView.swift
//  PokedexHeroes (iOS)
//
//  Created by Mikel Cobian on 14/3/22.
//

import SwiftUI

struct HeroesView: View {
    @StateObject  var viewModel  = viewModelHeros()
    @State private var filter:String=""
    
    var body: some View {
        NavigationView{
            List{
                if let hero = viewModel.heros {
                    ForEach(hero){data in
                        NavigationLink {
                            //Destination
                            //HeroesDetailView()
                        } label: {
                            //HeroesRowView()
                            Text(data.name ?? "Heroe random")
                        }

                    }
                }
            }
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: viewModelHeros(testing: true))
    }
}
