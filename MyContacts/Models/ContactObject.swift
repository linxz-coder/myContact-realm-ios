import RealmSwift

class ContactObject: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var phone: String
    @Persisted var isBuddy: Bool
}
