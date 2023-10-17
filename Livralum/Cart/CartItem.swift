//
//  CartItem.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI

struct CartItem: View {
    @State private var numberText = "1"
    @State private var number = 0
    
    var body: some View {
        VStack {
//            Rectangle()
//                .frame(height: 2)
//                .background(Color.black)
            VStack {
                Text("FN LB-92, A60, E-27/ 10W/12LED, 6400K")
            }.frame(maxWidth: 330)
            HStack {
                Spacer()
                Image("feron")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .background(
                                Image("feron")
                                    .resizable()
                                    .scaledToFill()
                            )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                VStack {
                    Text("Цена")
                    Text("52.75 ЛЕЙ")
                }
                Spacer()
                VStack {
                    Text("Кол-во").padding(.bottom, -5)
                    TextField("Кол-во", text: $numberText)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .onChange(of: numberText) { newValue in
                            if let parsedNumber = Int(newValue) {
                                number = parsedNumber
                            }
                        }
                        .frame(width: 70)
                }
                Button {
                    
                } label: {
                    Image(systemName: "trash.circle.fill")
                        .renderingMode(.original)
                        .padding(.trailing, 3)
                        .padding(.top, 3)
                        .font(.system(size: 40))
                }.padding(.top, 10)
                    .padding(.trailing, 10)
                
                
            }
//            Rectangle()
//                .frame(height: 2)
//                .background(Color.black)
        }
        
    }
}

struct CartItem_Previews: PreviewProvider {
    static var previews: some View {
        CartItem()
    }
}
