//
//  ArtistView.swift
//  trabalho
//
//  Created by formando on 11/09/2024.
//

import SwiftUI

struct ArtistCircleView: View {
    let artist: ArtistModel

    var body: some View {
        VStack {
            Image(artist.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .shadow(radius: 5)

            Text(artist.name)
                .font(.caption)
                .foregroundColor(.black)
        }
        .padding()
    }
}
