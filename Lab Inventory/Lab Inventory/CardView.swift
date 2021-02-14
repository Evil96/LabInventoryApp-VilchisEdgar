//
//  CardView.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 20/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        CardFront()
    }
}

struct CardFront: View {
    
    var body: some View {
        VStack {
            Text("").foregroundColor(Color.blue)
        }
        .frame(width: 300, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
        
    }
}
