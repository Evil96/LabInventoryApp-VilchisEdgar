//
//  AppView.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 08/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Lista de dispositivos")
                }
            
            MantenimientoView(item: MenuItem.example)
                .tabItem {
                    Image(systemName: "timer")
                    Text("Mantenimiento")
                }
            
            EnUsoView(item: MenuItem.example)
                .tabItem {
                    Image(systemName: "ellipsis.circle")
                    Text("En uso")
                }
            
            DetallesLabView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("El Lab")
                }
            
            //Idea: Un view para identificar a alguien con un código QR que genere la misma app
            //Complementando Idea: que esa cuarta view tenga información del laboratorio
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
