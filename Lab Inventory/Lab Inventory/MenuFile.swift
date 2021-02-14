//
//  MenuFile.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 02/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var model: String //Cambiar -> Ya lo cambié a model
    var año: String //Cambiar -> Ya lo cambié de price a año
    var label: [String] //Cambiar -> Ya lo cambié de restriction a label
    var description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }


    //Debug para mantener activo al objeto de tipo MenuItem
    //Va a ser necesario para algunas vistas en donde esté instanciado el objeto MenuItem
    //Vistas en los que está instanciado ahorita:
    
    //- ItemRow.swift
    //- ItemDetail.swift
    //- MantenimientoView.swift
    //- EnUsoView.swift
    #if DEBUG
    static let example = MenuItem(id: UUID(), name: "Maple French Toast", model: "Joseph Gonzalez", año: "2017", label: ["1", "2"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}
