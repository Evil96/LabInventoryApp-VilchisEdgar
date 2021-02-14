//
//  ItemRow.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 02/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String: Color] = ["1": .black]
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            HStack{
                Image(item.thumbnailImage)
                    //.clipShape(Circle())
                    //.overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.headline)
                    Text("Año: \(item.año)")
                }//Here is no needed, but if the names of the text can't see cool themselves we can use a modifier called .layoutPriority(1) so we can see the full text of each item
                
                Spacer()
                
                //\.self itself as an identifier
                //In other words, the DGNSV letters are UNIQUE, so they need a self identifier
                ForEach(item.label, id: \.self){ label in
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
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
