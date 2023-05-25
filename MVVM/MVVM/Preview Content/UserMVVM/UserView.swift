import SwiftUI
struct UserView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Text("Selected User: \(viewModel.users.first(where: { $0.id == viewModel.selectedUserID })?.name ?? "")")
                .font(.title)
                .padding()
            
            Image(systemName: viewModel.users.first(where: { $0.id == viewModel.selectedUserID })?.profilePicture ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Text("Email: \(viewModel.users.first(where: { $0.id == viewModel.selectedUserID })?.email ?? "")")
                .padding()
            
            Button("Update Email") {
                viewModel.updateUserEmail(newUserEmail: "newemail@example.com")
            }
            .padding()
            
            List(viewModel.users) { user in
                Button(action: {
                    viewModel.selectUser(user: user)
                }) {
                    HStack {
                        Image(systemName: user.profilePicture)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
