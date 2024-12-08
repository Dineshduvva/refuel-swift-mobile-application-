
import SwiftUI

struct StartPageView: View {
    var body: some View {
        VStack(spacing: 40) {
            // App Logo
            Image("refuell")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            
            
            Text("skip the gas station, we bring fuel to you.⛽️")
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.orange)
                .padding(.horizontal, 20)
            
            Image("re1")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            
            Spacer()
            
            NavigationLink(destination: SignupLoginView()) {
                Text("Get Started")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
        }
        .padding()
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartPageView()
        }
    }
}

