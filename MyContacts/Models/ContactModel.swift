import Foundation

struct ContactModel: Identifiable {
    var id: String
    var name: String
    var phone: String
    var isBuddy: Bool = false

    init(contact: ContactObject) {
        self.id = contact.id.stringValue
        self.name = contact.name
        self.phone = contact.phone
        self.isBuddy = contact.isBuddy
    }

}
