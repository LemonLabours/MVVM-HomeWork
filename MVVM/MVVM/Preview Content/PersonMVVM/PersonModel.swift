import SwiftUI

struct Person : Identifiable {
    var id = UUID()
    var name : String
    var email : String
    var phoneNumber : String
}
