//
//  UpperNavigation.swift
//  Goods
//
//  Created by Artiom Porcescu on 11.10.2023.
//

import SwiftUI

struct UpperNavigation: View {
    
    let navTitle: String
    @State var isShowingCart = true
    
    var body: some View {
        HStack {
            NavigationLink(destination: SideMenuView()) {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.black)
                    .font(Font.title.weight(.bold))
                    .frame(height: 30)
                    .padding(.leading, 20)
                    .padding(.top, 20)
            }

            Spacer()
            Text(navTitle)
                .padding(.top, 20)
                .font(.system(size: 30, weight: .bold, design: .default))
            Spacer()
            
            if isShowingCart {
                CartButton()
            } else {
                CartButton()
                    .disabled(true)
                    .opacity(0)
            }
            
        }.padding(.bottom, 30)
        .overlay(
            Rectangle()
                .frame(height: 4)
                .background(Color.black)
                .padding(.top, 62)
        )

    }
}

struct UpperNavigation_Previews: PreviewProvider {
    static var previews: some View {
        UpperNavigation(navTitle: "Lamps")
    }
}

struct CartButton: View {
    var body: some View {
        NavigationLink(destination: Cart()) {
            Image(systemName: "cart.fill")
                .foregroundColor(.black)
                .font(Font.title.weight(.bold))
                .frame(height: 30)
                .padding(.trailing, 20)
                .padding(.top, 20)
        }
    }
}
