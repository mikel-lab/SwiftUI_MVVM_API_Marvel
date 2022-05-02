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
        LazyVStack {
            
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
            
            if ((hero.name) != nil){
                Text(hero.name!)
                    .font(.title2)
                    .foregroundColor(.gray)
                    .bold()
            }
                
        }
        .onAppear{
            //viewmodel.loadImage(url: "\(hero.thumbnail.getUrlImage(photoType.portrait))")
            viewmodel.loadImage(url: hero.thumbnail.getUrlThumbnail())
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero: viewModelHeros(testing: true).getHeroUIDesing())
            .previewLayout(.fixed(width: 350, height: 350))
    }
}
