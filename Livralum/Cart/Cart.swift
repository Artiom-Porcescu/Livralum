//
//  Cart.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI

struct Cart: View {
    var body: some View {
        NavigationView {
            VStack(spacing: -10) {
                
               UpperNavigation(navTitle: "Корзина", isShowingCart: false)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10)], spacing: 0) {
                        ForEach(0...10, id: \.self) { _ in
                            CartItem().padding(.bottom, 30)
                        }
                    }.padding(.top, 10)
                }
                
                
                VStack {
                    Rectangle()
                        .frame(height: 4)
                        .background(Color.black)
                        .padding(.top, 10)
                    
                    HStack {
                        Spacer()
                        Text("Итого:")
                        Spacer()
                        Text("1560 ЛЕЙ")
                        Spacer()
                    }.padding()
                        .font(.system(size: 20, weight: .bold))
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.white)
                            Text("ОТПРАВИТЬ")
                                .foregroundColor(.white)
                        }.frame(maxWidth: 200)
                            .padding(20)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
                
                
                
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}

/*

 */
