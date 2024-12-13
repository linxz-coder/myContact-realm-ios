import SwiftUI

struct SingleContactView: View {
    @State private var isBuddy: Bool = false
    @ObservedObject private var viewModel = ContactsViewModel()
    var contact: ContactModel
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(spacing: 8){
                    HStack {
                        Text("Name:")
                        Text(contact.name)
                        Spacer()
                    }
                    HStack {
                        Text("Phone:")
                        Text(contact.phone)
                        Spacer()
                    }}
                Button(action: {
                    isBuddy.toggle()
                    viewModel.update(id: contact.id, name: contact.name, phone: contact.phone, isBuddy: isBuddy)
                }) {
                    Image(systemName: contact.isBuddy ? "heart.fill": "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor( contact.isBuddy ? Color.green: Color.gray)
                        .padding(.trailing)
                }
            }
        }
        .onAppear{
            isBuddy = contact.isBuddy
        }
        .padding(.all, 16)
    }
}

// Creating generic textfield design called NiceTextFieldStyle

struct NiceTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<_Label>) -> some View {
            configuration
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
        }
    }


// Creating generic button design called NiceButtonStyle

    struct NiceButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(16)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(.headline)
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                .animation(.easeInOut, value: 1.0)
        }
    }
