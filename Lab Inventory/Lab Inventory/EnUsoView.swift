//
//  EnUsoView.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 08/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct EnUsoView: View {
    static let colors: [String: Color] = ["1": .black]
    
    @EnvironmentObject var enuso: EnUso
    
    @State private var observaciones = ""
    
    var item: MenuItem
    
    var body: some View {
        NavigationView{
            List{
                ForEach(enuso.useItems){ useItem in
                    ForEach(useItem.label, id: \.self) { label in
                        Section(header: Text(useItem.name)) {
                            HStack{
                                Text(useItem.name)
                                Spacer()
                                Text("\(useItem.año)")
                                Text(label)
                                    .font(.caption)
                                    .fontWeight(.black)
                                    .padding(5)
                                    .background(Self.colors[label, default: .black])
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                
                Section{
                    TextField("Observaciones", text: $observaciones)
                }
                
                
            }
        .navigationBarTitle("En Uso")
        .listStyle(GroupedListStyle())
        //.navigationViewStyle(StackNavigationViewStyle())
        //.navigationBarItems(trailing: EditButton())
        }
    }
}

struct EnUsoView_Previews: PreviewProvider {
    static var previews: some View {
        EnUsoView(item: MenuItem.example)
    }
}
