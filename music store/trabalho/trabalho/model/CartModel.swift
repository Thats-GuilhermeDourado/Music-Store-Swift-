//
//  CartModel.swift
//  trabalho
//
//  Created by formando on 11/09/2024.
//

import SwiftUI


class CartModel: ObservableObject {
    @Published var items: [AlbunsModel] = []
    
    func addToCart(album: AlbunsModel) {
        items.append(album)
    }
}

