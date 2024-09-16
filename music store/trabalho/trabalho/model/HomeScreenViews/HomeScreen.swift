import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var cart: CartModel
    @State private var selectedAlbum: AlbunsModel? = nil
    @State private var showDetails = false
    @State private var showCart = false
    @State private var showOnboarding = true
    
    let topSellingAlbuns = [
        AlbunsModel(id: 1, title: .brat, image: "brat", price: "$3.44", color: "blue", description: "a"),
        AlbunsModel(id: 2, title: .HitMeHardAndSoft, image: "HitMeHardAndSoft", price: "$5.99", color: "green", description: "a"),
        AlbunsModel(id: 3, title: .ShortAndSweet, image: "ShortAndSweet", price: "$2.99", color: "red", description: "a"),
        AlbunsModel(id: 4, title: .Evermore, image: "evermore", price: "$6.00", color: "red", description: "a")
    ]
    
    let artists = [
        ArtistModel(id: 1, name: "Sabrina Carpenter", image: "espresso"),
        ArtistModel(id: 2, name: "Ariana Grande", image: "Ariana"),
        ArtistModel(id: 3, name: "The Weekdn", image: "TheWeeknd"),
        ArtistModel(id: 4, name: "Billie Eilish", image: "Billie")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                if showOnboarding {
                    BoardingScreenView(showOnboarding: $showOnboarding)
                } else {
                    VStack {
                        // Header
                        HStack {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                            
                            Spacer()
                            
                            Image(systemName: "apple.logo")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        
                        VStack(alignment: .leading) {
                            Text("Top Selling")
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .padding([.leading, .top])
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(alignment: .center, spacing: 20) {
                                    ForEach(topSellingAlbuns, id: \.id) { album in
                                        NavigationLink(destination: DetailsAlbumView(albuns: album)) {
                                            AlbumCardView(albuns: album)
                                                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                        
                        Text("Popular Artists")
                            .fontWeight(.bold)
                            .font(.system(.title2))
                            .foregroundColor(.black)
                            .padding([.top, .leading])
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(artists, id: \.id) { artist in
                                    ArtistCircleView(artist: artist)
                                }
                            }
                            .padding()
                        }
                        
                        Spacer()
                     
                        Button(action: {
                            showCart.toggle()
                        }) {
                            HStack {
                                Image(systemName: "cart")
                                Text("View Cart (\(cart.items.count))")
                                    .font(.headline)
                            }
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .opacity(0.6)
                        }
                        .padding()
                        .sheet(isPresented: $showCart) {
                            CartView()
                                .environmentObject(cart)
                        }
                      
                        VStack{
                            HStack(spacing: 25){
                                
                                NavigationLink(destination: Text("Search View")) {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 20))
                                        .padding()
                                }
                                NavigationLink(destination: Text("Radio View")) {
                                    Image(systemName: "radio")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 20))
                                        .padding()
                                }
                                NavigationLink(destination: Text("Browse View")) {
                                    Image(systemName: "square.grid.2x2")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 20))
                                        .padding()
                                }
                                NavigationLink(destination: Text("Library View")) {
                                    Image(systemName: "book")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 20))
                                        .padding(0)
                                }
                                NavigationLink(destination: Text("Listening Now View")) {
                                    Image(systemName: "play.circle")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 20))
                                    
                                        .padding()
                                }
                            }
                            .background(Color.white)
                        }
                    }
                    .navigationTitle("Music Store")
                    .navigationBarHidden(true)
                }
            }
        }
    }
}

struct AlbumCardView: View {
    let albuns: AlbunsModel
    
    var body: some View {
        HStack {
            Image(albuns.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(albuns.title.rawValue)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                
                Text(albuns.price)
                    .font(.system(size: 16))
                    .foregroundColor(.black.opacity(0.7))
            }
            Spacer()
        }
        .padding()
        .frame(width: 275, height: 80, alignment: .leading)
        .background(Color(albuns.color))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct DetailsAlbumView: View {
    var albuns: AlbunsModel
    @EnvironmentObject var cart: CartModel
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Image(albuns.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding(.top, 40)
                .shadow(radius: 10)
            
            Text("\(albuns.title.rawValue) - CD")
                .font(.title)
                .fontWeight(.bold)
            
            Text("This album is a collection of amazing music in the genre of \(albuns.title.rawValue).")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            Text(albuns.price)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: "hourglass")
                    .foregroundColor(.gray)
                Text("On Store")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("\(albuns.price)")
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
                    cart.addToCart(album: albuns)
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
    }
}

struct BoardingScreenView: View {
    @Binding var showOnboarding: Bool
    
    var body: some View {
        ZStack {
            
            Image("music")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
                .blur(radius: 5)
                .opacity(0.8)
            
            VStack(spacing: 10) {
              
                Text("Discover Your Favorite Albums")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
              
                Text("Music is Life")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)

                
                
                Button(action: {
                    showOnboarding = false
                }) {
                    Text("Next")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250, height: 60, alignment: .center)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                        .shadow(radius: 10)
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 30)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    HomeScreen()
        .environmentObject(CartModel())
}
