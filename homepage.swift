
import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView { // Wrap the entire view in NavigationView
            VStack {
                // Top Bar with Location and Profile
                HStack {
                    Text("Visakhapatnam")
                        .font(.headline)
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding()
                
                // Offers Section
                VStack {
                    Text("Offers and Rewards")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Save up to 10% on your first order")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding()
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Hello, Bhavana")
                        .font(.headline)
                    
                    Text("Select Product")
                        .font(.title2)
                        .bold()
                    
                    // Fuel Options
                    HStack(spacing: 20) {
                        FuelProductView(name: "Diesel")
                        FuelProductView(name: "Petrol")
                        FuelProductView(name: "Power Petrol")
                    }
                }
                .padding()
                
                Spacer()
                
               
                Text("Refuel Toll free:1100010098")
                    .font(.headline)
                HStack {
                    TabBarItemView(image: "wallet.pass", title: "Wallet")
                    TabBarItemView(image: "location", title: "Locations")
                    TabBarItemView(image: "house", title: "Home")
                    TabBarItemView(image: "cart", title: "Orders")
                    TabBarItemView(image: "person.crop.circle", title: "Account")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                
            }
        }
    }
}


struct FuelProductView: View {
    let name: String
    var body: some View {
        VStack {
            Image(systemName: "fuelpump")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(name)
                .font(.subheadline)
            
            
            NavigationLink(destination: ProductSelectionView(productType: name)) {
                Text("+ Buy")
                    .font(.caption)
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .frame(width: 100)
    }
}

struct TabBarItemView: View {
    let image: String
    let title: String
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
            Text(title)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
#Preview()
{ HomePageView()
}
