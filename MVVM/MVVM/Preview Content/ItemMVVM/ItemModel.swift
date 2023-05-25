//
//  ItemModel.swift
//  MVVM
//
//  Created by Lama AL Yousef on 25/05/2023.
//

import SwiftUI

struct Item : Identifiable , Codable {
    
    var id = UUID()
    var name : String
    var description : String
    
    static var exampleItem = Item(name: "Oven", description: "example description")
    
}
