//
//  SideMenuView.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavLink(name: "Главная", icon: "house.fill", destination: Homepage())
                NavLink(name: "Лампы", icon: "lightbulb.fill", destination: LampsCollection(lamps: [[String : Any]](), lamps2: [Lamp]() ))
                NavLink(name: "Розетки", icon: "poweroutlet.type.c.square", destination: SocketsCollection())
                NavLink(name: "Выключатели", icon: "lightswitch.off.square", destination: SwitchesCollection())
                NavLink(name: "Плафоны", icon: "light.recessed.3.inverse", destination: PlafsCollection())
                NavLink(name: "Контакты", icon: "person.line.dotted.person.fill", destination: Contacts())
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

struct NavLink<Destination: View>: View {
    let name: String
    let icon: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Label(name, systemImage: icon)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .padding(.leading, 20)
            Spacer()
        }
    }
}
