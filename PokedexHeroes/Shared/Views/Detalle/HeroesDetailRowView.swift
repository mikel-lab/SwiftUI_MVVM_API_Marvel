//
//  HeroesDetailRowView.swift
//  PokedexHeroes (iOS)
//
//  Created by Mikel Cobian on 12/5/22.
//

import SwiftUI

struct HeroesDetailRowView: View {
    var serie:Result
    @StateObject private var photoViewModel = PhotoViewModel()
    
    var body: some View {
        VStack{
            // Image & Title
            ZStack{
                // foto de la serie
                if let foto = photoViewModel.photo{
                    foto
                        .resizable()
                        .opacity(0.3)
                        .aspectRatio(contentMode: .fit)
                    
                } else {
                    // sin foto
                    Image(systemName: "photo")
                        .resizable()
                        .opacity(0.3)
                        .aspectRatio(contentMode: .fit)
                }
      
                // Titulo
                if let titulo = serie.title {
                    Text("\(titulo)")
                        .font(.title)
                        .foregroundColor(Color.black)
                        .bold()
                }
               
            }
            
            // Description
            if let descrip = serie.description {
                Text("\(descrip)")
                    .foregroundColor(Color.gray)
                    .font(.body)
            }
            else{
                Text("Sin descripcion")
                    .foregroundColor(Color.gray)
                    .font(.body)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.gray.opacity(0.4))
        )
        .onAppear{
            if let _ = photoViewModel.photo{
                return
            }
            else{
                //photoViewModel.loadImage(url: serie.thumbnail.getUrlImage(type: .portrait))
                photoViewModel.loadImage(url: serie.thumbnail.getUrlThumbnail())
            }
        }
    }
}
/*
struct HeroesDetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesDetailRowView()
    }
} */
