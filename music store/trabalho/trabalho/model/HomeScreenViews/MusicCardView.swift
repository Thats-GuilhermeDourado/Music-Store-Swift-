//
//  MusicCardView.swift
//  trabalho
//
//  Created by formando on 11/09/2024.
//

import SwiftUI

let sampleAlbum: AlbunsModel = AlbunsModel(id: 1, title: .brat, image: "brat", price: "4.99$", color: "2", description: "a")

struct MusicCardView: View {
    let album: AlbunsModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 1) {
                Text(album.title.rawValue)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(album.price)
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.black.opacity(0.7))
                
                Spacer()
            }
            .padding()
            .frame(width: 175, height: 150)
            .background(Color(album.color))
            .cornerRadius(20)
            .shadow(radius: 5)
            
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .offset(y: 50)
        }
        .frame(width: 175, height: 250)
        .padding()
    }
}

#Preview {
    MusicCardView(album: sampleAlbum)
}






