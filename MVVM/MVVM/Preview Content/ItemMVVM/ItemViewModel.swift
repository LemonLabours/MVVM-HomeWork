import SwiftUI

extension ItemView {
    @MainActor class ItemViewModel: ObservableObject {
        @AppStorage("isTurnedOn") var isTurnedOn: Bool = false
        @AppStorage("counter") var counter: Int = 0
        
      
        var itemList: [Item] {
            get {
                guard let data = UserDefaults.standard.data(forKey: "itemList"),
                      let decodedItemList = try? JSONDecoder().decode([Item].self, from: data)
                else {
                    return []
                }
                return decodedItemList
            }
            set {
                if let encodedData = try? JSONEncoder().encode(newValue) {
                    UserDefaults.standard.set(encodedData, forKey: "itemList")
                }
            }
        }
        
        func increment() {
            counter += 1
        }
        
        func addItem() {
            let randomItems = ["TV", "AC", "LIGHTS", "SPEAKERS", "FREEZER"]
            let item = randomItems.randomElement()!
            
            let newItem = Item(name: item, description: "item \(itemList.count + 1)")
            
            withAnimation {
                var updatedItemList = itemList
                updatedItemList.insert(newItem, at: 0)
                itemList = updatedItemList
            }
        }
    }
}
