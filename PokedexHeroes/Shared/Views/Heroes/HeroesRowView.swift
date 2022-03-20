//
//  HeroesRowView.swift
//  PokedexHeroes (iOS)
//
//  Created by Mikel Cobian on 14/3/22.
//

import SwiftUI

struct HeroesRowView: View {
    var hero: Result
    @StateObject private var viewmodel = PhotoViewModel()
    
    var body: some View {
        VStack{
            
            if let photo = viewmodel.photo {
                photo
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            } else{
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            }
            
            Text(if let name = hero.name {
                .font(.title2)
                .foregroundColor(.gray)
                .bold()
            }else{
                name ="Heroe random"
                    .font(.title2)
                    .foregroundColor(.gray)
                    .bold()
            } )
                
        }
        .onAppear{
            viewmodel.loadImage(url: "\(hero.thumbnail.getUrlImage(photoType.portrait))")
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero: viewModelHeros(testing: true).getHeroUIDesing())
            .previewLayout(.fixed(Width: 350, heigth: 350))
    }
}
