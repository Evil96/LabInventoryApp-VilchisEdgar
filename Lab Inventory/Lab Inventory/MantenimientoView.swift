//
//  Mantenimiento.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 08/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct MantenimientoView: View {
    static let colors: [String: Color] = ["1": .black]
    
    @EnvironmentObject var mantenimiento: Mantenimiento
    
    @State private var observaciones = ""
        
    var item: MenuItem
    
    var body: some View {
        NavigationView{
            List{
                ForEach(mantenimiento.items){ item in
                    ForEach(item.label, id: \.self) { label in
                        Section(header: Text(item.name)) {
                            HStack{
                                Text(item.name)
                                Spacer()
                                Text("\(item.año)")
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
                }.onDelete(perform: deleteItems)
                
                
                Section{
                    TextField("Observaciones", text: $observaciones)
                }
                
            }
        .navigationBarTitle("Mantenimiento")
        .listStyle(GroupedListStyle()) //Estilo de listado
        .navigationViewStyle(StackNavigationViewStyle()) //Estilo de navegación
        .navigationBarItems(trailing: EditButton()) //Botón para poder Editar la lista (borrar elementos)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        mantenimiento.items.remove(atOffsets: offsets)
    }
}

struct MantenimientoView_Previews: PreviewProvider {
    static var previews: some View {
        MantenimientoView(item: MenuItem.example)
    }
}
