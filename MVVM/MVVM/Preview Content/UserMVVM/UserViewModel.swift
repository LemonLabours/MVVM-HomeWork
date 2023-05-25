import SwiftUI


class UserViewModel: ObservableObject {
    @Published var users: [User] = [
        User(name: "Lama", email: "Lama@gmail.com", profilePicture: "1"),
        User(name: "Hala", email: "Hala@gmail.com", profilePicture: "2"),
        User(name: "Nujood", email: "Nujood@gmail.com", profilePicture: "3")
    ]
    
    @Published var selectedUserID: UUID
    
    init() {
        if let selectedUserID = UserDefaults.standard.string(forKey: "selectedUserID") {
            self.selectedUserID = UUID(uuidString: selectedUserID) ?? UUID()
        } else {
            self.selectedUserID = UUID()
        }
    }
    
    func selectUser(user: User) {
        selectedUserID = user.id
        UserDefaults.standard.set(selectedUserID.uuidString, forKey: "selectedUserID")
    }
    
    func updateUserEmail(newUserEmail: String) {
        guard let userIndex = users.firstIndex(where: { $0.id == selectedUserID }) else {
            return
        }
        
        users[userIndex].email = newUserEmail
    }
}

