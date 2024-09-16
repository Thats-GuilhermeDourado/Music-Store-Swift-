//
//  TopSellingView.swift
//  trabalho
//
//  Created by formando on 11/09/2024.
//

import SwiftUI

struct TopSellingView: View {
    
    let images: [AlbunsModel] = [
        .init(id: 0, title: .brat, image: "brat", price: "$1.99 each", color: "2", description: "This work has been described as electropop, club-pop, hyperpop, electroclash, and dance styles."),
        .init(id: 1, title: .HitMeHardAndSoft, image: "HitMeHardAndSoft", price: "$2.99 each", color: "6", description: "a"),
        .init(id: 3, title: .ShortAndSweet, image: "ShortAndSweet", price: "$1.99 each", color: "3", description: "a"),
        
        .init(id: 4, title: .Evermore, image: "evermore", price: "$1.99 each", color: "3", description: "a")
    ]
    
    var body: some View {

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(images, id: \.id) { post in
                            
                                MusicCardView(album: post)
                                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            }
                        }
                    }
                    .padding()
                }
            }
        
    
    
    
    #Preview {
        TopSellingView()
    }
