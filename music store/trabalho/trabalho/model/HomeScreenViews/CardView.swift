//
//  CardView.swift
//  trabalho
//
//  Created by formando on 11/09/2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartModel
    
    var body: some View {
        VStack {
            Text("Your Cart")
                .font(.largeTitle)
                .padding(.top, 40)
            
            if cart.items.isEmpty {
                Text("Your cart is empty")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            } else {
                List {
                    ForEach(cart.items, id: \.id) { album in
                        HStack {
                            Image(album.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            
                           
                            
                            Spacer()
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CartView()
        .environmentObject(CartModel())
}

