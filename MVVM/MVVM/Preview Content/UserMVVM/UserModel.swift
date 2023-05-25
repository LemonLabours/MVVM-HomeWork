import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var profilePicture: String
}
