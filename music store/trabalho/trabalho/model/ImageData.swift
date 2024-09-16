//
//  ImageData.swift
//  trabalho
//
//  Created by formando on 11/09/2024.
//

import Foundation

struct AlbunsModel {
    var id: Int
    var title: albumTitle
    var image: String
    var price: String
    var color: String
    var description: String
}

enum albumTitle: String{
    case brat, HitMeHardAndSoft, ShortAndSweet, Evermore
}
