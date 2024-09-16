import SwiftUI

struct OnBoardingScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Image("personlisteningmusic")
                        .resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                .offset(y: 9)
                }

                VStack(alignment: .center, spacing: 10) {
                    Text("Buy Your Favorite Albums")
                        .fontWeight(.bold)
                        .font(.system(.title))
                        .padding([.leading, .top])

                    Text("Music is Life")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()

                NavigationLink(destination: HomeScreen()) {
                    Text("Next")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                        .padding()
                }
                .padding(.bottom, 100)
            }
            
        }
    }
}

#Preview {
    OnBoardingScreenView()
}
