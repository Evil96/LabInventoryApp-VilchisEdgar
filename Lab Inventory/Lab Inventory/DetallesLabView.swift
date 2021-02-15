//
//  DetallesLabView.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 15/10/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct DetallesLabView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Image("header").resizable().scaledToFit()

                Spacer()

                Image("ioslablogo").resizable().scaledToFit()

                Spacer()
      
                Text("Información del creador y propósito:")
        
                Spacer()
          
                Text("Creador: Edgar Vilchis \n\n Propósito: Esta app nació de la idea de tener un mejor orden y estructura sobre el equipo \n de cómputo del laboratorio. \n\n Accesibilidad: Todo aquél que deseé realizar modificaciones a esta aplicación es bienvenido. \n\n URL del repositorio: https://github.com/Evil96/LabInventoryApp-VilchisEdgar").font(.subheadline)

                Spacer()

                Image("footer").resizable().scaledToFit()

            }

        }
    }
}

struct DetallesLabView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesLabView()
    }
}
