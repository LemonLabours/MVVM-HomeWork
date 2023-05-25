//
//  PersonViewModel.swift
//  MVVM
//
//  Created by Lama AL Yousef on 24/05/2023.
//

import SwiftUI

extension PersonView {
    @MainActor class PersonViewModel: ObservableObject{
        @Published var people : [Person] = []
        
        init(){
            addPeople()
        }
        func addPeople() {
            people = peopleData
        }
        func shuffleOrder(){
            people.shuffle()
        }
        
        func reverseOrder(){
            people.reverse()
        }
        func removeLastOrder(){
            people.removeLast()
        }
        func removeFirstOrder(){
            people.removeFirst()
        }
    }
}


let peopleData = [
    Person(name: "Sarah", email: "sarah@gmail.com", phoneNumber: "0551234560"),
    Person(name: "Lama", email: "lama.i.alyuosef@gmail.com", phoneNumber: "0545271117"),
    Person(name: "Hala", email: "Hala@gmail.com", phoneNumber: "0545271117"),
    Person(name: "Raghad", email: "Raghad@gmail.com", phoneNumber: "0545271117"),
    Person(name: "lol", email: "lol@gmail.com", phoneNumber: "0545271117")
    
]
