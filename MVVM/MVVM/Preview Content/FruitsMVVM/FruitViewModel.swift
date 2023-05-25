//
//  FruitViewModel.swift
//  MVVM
//
//  Created by Lama AL Yousef on 25/05/2023.
//

import SwiftUI


class FruitViewModel: ObservableObject {
    @Published var fruits: [Fruit] = [
        Fruit(name: "Apple", imageName: "apples"),
        Fruit(name: "Banana", imageName: "bananars"),
        Fruit(name: "Orange", imageName: "orange")
    ]
    
    @Published var selectedFruitID: UUID
    
    init() {
        if let selectedFruitID = UserDefaults.standard.string(forKey: "selectedFruitID") {
            self.selectedFruitID = UUID(uuidString: selectedFruitID) ?? UUID()
        } else {
            self.selectedFruitID = UUID()
        }
    }
    
    func selectFruit(fruit: Fruit) {
        selectedFruitID = fruit.id
        UserDefaults.standard.set(selectedFruitID.uuidString, forKey: "selectedFruitID")
    }
    
    func updateFruitImage(newImageName: String) {
        guard let fruitIndex = fruits.firstIndex(where: { $0.id == selectedFruitID }) else {
            return
        }
        
        fruits[fruitIndex].imageName = newImageName
    }
}
