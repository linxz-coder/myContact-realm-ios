import SwiftUI

struct ContentView: View {
    @State var isPresentingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ContactListView()
            }
            .padding()
            .navigationTitle("My Contacts")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $isPresentingSheet) {
                AddContactView()
            }
            .navigationBarItems(
                trailing: Button(action: {
                    isPresentingSheet.toggle()
                }) {
                    Image(systemName: "person.badge.plus")
                    Text("Add")
                }
            )
            
        }
    }
}

#Preview {
    ContentView()
}
