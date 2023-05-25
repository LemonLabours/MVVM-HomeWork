import SwiftUI

struct PersonView: View {
    @ObservedObject var vm = PersonViewModel()
    @Binding var selectedFunctions: [String]
    
    init(selectedFunctions: Binding<[String]>) {
        // Provide a default value for the selectedFunctions property
        self._selectedFunctions = selectedFunctions
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                ForEach(vm.people) { person in
                    HStack {
                        Text(person.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text(person.phoneNumber)
                            Text(person.email)
                        }
                    }
                    .frame(height: 80)
                    .padding(12)
                }
                
                Menu("Menu".uppercased()) {
                    Button("Reverse", action: {
                        vm.reverseOrder()
                        selectedFunctions.append("Reverse")
                    })
                    Button("Shuffle", action: {
                        vm.shuffleOrder()
                        selectedFunctions.append("Shuffle")
                    })
                    Button("Remove last", action: {
                        vm.removeLastOrder()
                        selectedFunctions.append("Remove last")
                    })
                    Button("Remove first", action: {
                        vm.removeFirstOrder()
                        selectedFunctions.append("Remove first")
                    })
                }
                .padding()
            }
        }
        .onAppear {
            print(selectedFunctions) // Access and use the selectedFunctions array here
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(selectedFunctions: .constant([]))
    }
}
