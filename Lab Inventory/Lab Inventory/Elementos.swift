//
//  Elementos.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 02/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct SeccionElementos: Codable {
    var id: UUID
    var nombre: String
    var elementos: [ItemElemento]
}

struct ItemElemento: Codable, Equatable {
    var id: UUID
    var nombre: String
    //var photoCredit: String
    var precio: Int
    var restricciones: [String]
    var descripcion: String
    
    var imagenPrincipal: String {
        nombre.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(imagenPrincipal)-thumb"
    }

    #if DEBUG
    static let example = ItemElemento(id: UUID(), nombre: "Maple French Toast", precio: 6, restricciones: ["G", "V"], descripcion: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}
