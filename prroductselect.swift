
import SwiftUI


struct ProductSelectionView: View {
    var productType: String

    @State private var quantities: [String: Int] = ["IndianOil": 1, "Bharat Petroleum": 1, "HP": 1]

    
    let prices: [String: Int] = ["Diesel": 98, "Petrol": 110, "Power Petrol": 115]

    var body: some View {
        VStack {
          
            Text(productType)
                .font(.largeTitle)
                .bold()
                .padding(.top)

            Text("Select a vendor and adjust quantity")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom)

           
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                ForEach(["IndianOil", "Bharat Petroleum", "HP"], id: \.self) { vendor in
                    VendorView(
                        vendor: vendor,
                        price: prices[productType] ?? 0, // Get price for the selected product type
                        quantity: $quantities[vendor]
                    )
                }
            }
            .padding()
        }
        .padding()
        .navigationTitle("Select Vendor")
    }
}

struct VendorView: View {
    var vendor: String
    var price: Int // Pass price to the vendor view
    @Binding var quantity: Int?

    var body: some View {
        VStack(spacing: 10) {
            Text(vendor)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text("Price: ₹\(price)") // Display price
                .font(.subheadline)
                .foregroundColor(.gray)

            Image(systemName: "fuelpump.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()

            HStack {
                Button(action: {
                    if let currentQuantity = quantity, currentQuantity > 1 {
                        quantity = currentQuantity - 1
                    }
                }) {
                    Text("-")
                        .frame(width: 30, height: 30)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                }

                Text("\(quantity ?? 1)")
                    .font(.headline)
                    .padding(.horizontal, 10)

                Button(action: {
                    if let currentQuantity = quantity {
                        quantity = currentQuantity + 1
                    }
                }) {
                    Text("+")
                        .frame(width: 30, height: 30)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                }
            }

            NavigationLink(
                destination: CheckoutView(
                    vendor: vendor,
                    quantity: quantity ?? 1,
                    price: price
                ),
                label: {
                    Text("Checkout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct CheckoutView: View {
    var vendor: String
    var quantity: Int
    var price: Int

    @State private var name = ""
    @State private var address = ""
    @State private var contact = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Checkout")
                .font(.largeTitle)
                .bold()

            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter your address", text: $address)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter your contact number", text: $contact)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Total Price: ₹\(quantity * price + 20) (Including ₹20 Delivery Fee)")
                .font(.headline)
                .foregroundColor(.green)

            NavigationLink(
                destination: PaymentView(totalPrice: quantity * price + 20),
                label: {
                    Text("Proceed to Payment")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
            .padding()

            Spacer()
        }
        .padding()
    }
}

struct PaymentView: View {
    var totalPrice: Int

    @State private var selectedPaymentMethod = "COD"
    @State private var selectedCardType = "Visa" 
    @State private var upiID = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Payment")
                .font(.largeTitle)
                .bold()

            Text("Total Price: ₹\(totalPrice)")
                .font(.title2)
                .foregroundColor(.green)

       
            Picker("Select Payment Method", selection: $selectedPaymentMethod) {
                Text("Cash on Delivery").tag("COD")
                Text("Card Payment").tag("Card")
                Text("UPI").tag("UPI")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

           
            if selectedPaymentMethod == "Card" {
                VStack(spacing: 10) {
                    Text("Select Card Type")
                        .font(.headline)

                    Picker("Card Type", selection: $selectedCardType) {
                        Text("Visa").tag("Visa")
                        Text("MasterCard").tag("MasterCard")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    Text("Enter Card Details")
                        .font(.headline)
                        .padding(.top)

                    TextField("Card Number", text: .constant("")) // Placeholder for card details
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()

                    TextField("Expiry Date (MM/YY)", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()

                    TextField("CVV", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }

          
            if selectedPaymentMethod == "UPI" {
                VStack(spacing: 10) {
                    Text("Enter UPI ID")
                        .font(.headline)

                    TextField("e.g., user@upi", text: $upiID)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .padding()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }

         
            NavigationLink(
                destination: OrderConfirmationView(),
                label: {
                    Text("Confirm Payment")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
            .padding()

            Spacer()
        }
        .padding()
    }
}

struct OrderConfirmationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)

            Text("Order Confirmed")
                .font(.largeTitle)
                .bold()

            Text("Thank you for your purchase!")
                .font(.title2)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
    }
}

struct ProductSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSelectionView(productType: "Diesel")
    }
}
