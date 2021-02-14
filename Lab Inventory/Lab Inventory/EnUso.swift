//
//  EnUso.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 09/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

class EnUso: ObservableObject {
    @Published var useItems = [MenuItem]()
    
    func add(item: MenuItem) {
        useItems.append(item)
    }

    func remove(item: MenuItem) {
        if let index = useItems.firstIndex(of: item) {
            useItems.remove(at: index)
        }
    }
}
