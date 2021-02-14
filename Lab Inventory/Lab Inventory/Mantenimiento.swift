//
//  Element.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 02/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

class Mantenimiento: ObservableObject { //Made Observable after declaring @Published
    @Published var items = [MenuItem]()
    //Published:
    //When that changes, tell everybody who's watching it
    //Take a look to SceneDelegate.swift for more detail

    
    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
