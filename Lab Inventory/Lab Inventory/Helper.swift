//
//  Helper.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 02/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import UIKit

//JSON Bundle decodable file
//Este archivo funciona para que Bundle tenga como propiedad también a .main.decode

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
