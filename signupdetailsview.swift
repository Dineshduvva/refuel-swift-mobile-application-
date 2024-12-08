
import SwiftUI

struct SignupDetailsView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image("re3") 
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("Signup Details")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter your name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("Enter your email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
            
            SecureField("Create a password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                print("User signed up with name: \(name), email: \(email)")
            }) {
                Text("Sign Up")
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
    }
}
#Preview {
    SignupDetailsView()
}
   
