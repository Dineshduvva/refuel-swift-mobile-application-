import SwiftUI

struct LocationView: View {
    @State private var location = ""
    @State private var isHomeActive = false

    var body: some View {
        VStack {
            Text("Enter Your Location")
                .font(.title2)
                .padding()
            Image("re5")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            TextField("Enter location", text: $location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                if location.lowercased() == "vizag" {
                    isHomeActive = true
                }
            }) {
                Text("Submit")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            .padding(.top)

            NavigationLink(
                destination: HomePageView(),
                isActive: $isHomeActive
            ) {
                EmptyView()
            }
        }
        .navigationTitle("Location")
    }
}
#Preview {
    LocationView()
}
