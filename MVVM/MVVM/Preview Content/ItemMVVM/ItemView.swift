import SwiftUI

struct ItemView: View {
    @StateObject private var vm = ItemViewModel()
    
    var body: some View {
        VStack {
            Toggle("Toggle Switch", isOn: $vm.isTurnedOn)
                .padding()
            HStack {
                Button("Increment") {
                    vm.increment()
                }
                Text("\(vm.counter)")
                    .bold()
                    .foregroundColor(Color.gray)
                    .padding()
            }
            
            List(vm.itemList) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.description)
                }
            }
            .listStyle(.plain)
            .background(.thinMaterial)
            
            Button("Add Item") {
                vm.addItem()
            }
            .padding()
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
