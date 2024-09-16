import SwiftUI

struct DetailsView: View {
    var album: AlbunsModel
    
    @State private var quantity: Int = 1
    @EnvironmentObject var cart: CartModel
    
    var body: some View {
        VStack(spacing: 20) {
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding(.top, 40)
                .shadow(radius: 10)
            
            Text("\(album.title) - CD")
                .font(.title)
                .fontWeight(.bold)
            
            Text(album.description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            HStack {
                Image(systemName: "hourglass")
                    .foregroundColor(.gray)
                Text("On Store")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("\(album.price)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
            
            HStack {
                Button(action: {
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus")
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(5)
                }
                
                Text("\(quantity)")
                    .font(.title2)
                    .padding(.horizontal, 10)
                
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(5)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            Button(action: {
                for _ in 0..<quantity {
                    cart.addToCart(album: album)
                }
            }) {
                Text("Add to Cart")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.top, 30)
    }
}

#Preview {
    DetailsView(album: AlbunsModel(id: 1, title: .brat, image: "brat", price: "$4.99", color: "2", description: "a"))
        .environmentObject(CartModel())
}
