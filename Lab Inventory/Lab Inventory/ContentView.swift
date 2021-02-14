//
//  ContentView.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 02/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "elementos.json")
    
    var body: some View {
        NavigationView{
            List{
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        
                        ForEach(section.items){ item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("iOS Lab FI")
            .listStyle(GroupedListStyle())
        }
        //.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
