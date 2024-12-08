import SwiftUI

struct SignupLoginView: View {
    @State private var userID = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @State private var navigateToLocationInput = false
    @State private var navigateToSignupDetails = false

    var body: some View {
        VStack(spacing: 30) {
            // Title
            Image("re3") 
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
            

            TextField("Enter your ID", text: $userID)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .autocapitalization(.none)
            
       
            SecureField("Enter your Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
         
            NavigationLink(destination: LocationView(), isActive: $navigateToLocationInput) {
                Button(action: {
                    if userID.lowercased() == "dinesh" && password == "123" {
                        loginMessage = "Login Successful!"
                        navigateToLocationInput = true
                    } else {
                        loginMessage = "Invalid ID or Password"
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 40)
            
           
            Text(loginMessage)
                .foregroundColor(loginMessage == "Login Successful!" ? .green : .red)
                .font(.subheadline)
            
            Spacer()
            
           
            NavigationLink(destination: SignupDetailsView(), isActive: $navigateToSignupDetails) {
                Button(action: {
                    navigateToSignupDetails = true
                }) {
                    Text("New User? Sign Up")
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
            }
        }
        .padding()
        .navigationTitle("") 
        .navigationBarHidden(true)
    }
}
#Preview {
    SignupLoginView()
}
