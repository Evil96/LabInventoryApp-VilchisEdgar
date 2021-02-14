//
//  ItemDetail.swift
//  Lab Inventory
//
//  Created by Edgar Vilchis on 06/07/20.
//  Copyright © 2020 Edgar Vilchis. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var mantenimiento: Mantenimiento
    @EnvironmentObject var enuso: EnUso
    
    @State private var animationAmountFirst: CGFloat = 1 //Animacion circular del primer boton
    @State private var animationAmountSecond: CGFloat = 1 //Animacion circular del segundo boton
    
    @State private var enabled = false
    
    @State private var secondAnimationAmount = 0.0 //Para la animación de la rotación
    
    //@State private var presentingButton = false
    
    //Tarjeta
    
    var item: MenuItem
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                //Seccion del primer VStack
                Section{
                    
                    VStack{
                        
                        //Seccion de la imagen en el top
                        Section {
                            ZStack(alignment: .bottomTrailing){
                                Image(self.item.mainImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width)
                                    .padding(.top)
                                
                                
                                    
                                Text("Modelo: \(self.item.model)")
                                    .padding(4)
                                    .background(Color.black)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .offset(x: -5, y: -5)
                                
                            }
                        }
                        
                        Spacer()
                        
                        //Seccion de la descripción del equipo que va a estar jalando del JSON
                        Section {
                            ZStack {
                                CardView()
                                
                                Text(self.item.description)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .clipShape(Rectangle()) //Esto se ve feo
                            }
                        }
                        
                        Spacer(minLength: 25)
                        
                        //Seccion botones
                        Section {
                            VStack {
                                Text("¿Equipo dañado?")
                                    .font(.title)
                                    .padding()
                                
                                Button("📲") {
                                    self.mantenimiento.add(item: self.item)
                                    self.enabled.toggle()
                                }
                                .padding(40)
                                .background(self.enabled ? Color.blue : Color.red)
                                .font(.title)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.red)
                                        .scaleEffect(self.animationAmountFirst)
                                        .opacity(Double(2 - self.animationAmountFirst))
                                        .animation(
                                            Animation.easeOut(duration: 1)
                                                .repeatForever(autoreverses: false)
                                        )
                                        .onAppear {
                                            self.animationAmountFirst = 2
                                        }
                                )
                                
                                //Idea: que al presionar el botón salga una paginita que dé información sobre el mantenimiento que se requiera
                                /*
                                 .sheet(isPresented: $presentingButton) {
                                 MantenimientoView(item: self.item)
                                 }
                                 */
                                
                                Spacer(minLength: 50)
                                
                                Text("¿El equipo está en uso?")
                                    .font(.title)
                                    .padding()
                                
                                Button("⏳") {
                                    self.enuso.add(item: self.item)
                                    withAnimation(.interpolatingSpring(stiffness: 10, damping: 10)) {
                                        self.secondAnimationAmount += 180
                                    }
                                }
                                .padding(40)
                                .background(Color.blue)
                                .font(.title)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.blue)
                                        .scaleEffect(self.animationAmountSecond)
                                        .opacity(Double(2 - self.animationAmountSecond))
                                        .animation(
                                            Animation.easeOut(duration: 1)
                                                .repeatForever(autoreverses: false)
                                        )
                                        .onAppear {
                                            self.animationAmountSecond = 2
                                        }
                                )
                                .rotation3DEffect(.degrees(self.secondAnimationAmount), axis: (x: 0, y: 1, z: 0))
                                
                                Spacer(minLength: 50)
                            }//Cierre de VStack dentro de sección botones
                        }//Cierre de Seccion botones
                        
                        
                    } //Cierre del VStack
                    
                } //Cierre del Section 1 (el que contiene al primer VStack
                    .navigationBarTitle("Detalles", displayMode: .inline)
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
    }
}
