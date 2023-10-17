//
//  SwitchesCollection.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI

struct SwitchesCollection: View {
    
    @State var switches: [[String: Any]] = []
    @State var switches2: [Socket] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: -10) {
                UpperNavigation(navTitle: "Выключатели")
                    .onAppear {
                        Task {
                            switches = try await GoodsVM.fetchAllGoods(for: "switches")
                            for item in switches {
                                switches2.append(Socket(promoText: item["promoText"] as! String, country: item["manufacturer"] as! String, itemName: item["itemName"] as! String, actualPrice: item["actualPrice"] as! Double, promoPrice: item["promoPrice"] as! Double))
                            }
                            print("Lamps: \(switches2)")
                        }
                    }

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                        ForEach(0...switches2.count, id: \.self) { index in
                            if index < switches2.count {
                                ListItemView(name: switches2[index].itemName, actualPrice: switches2[index].actualPrice, promoPrice: switches2[index].promoPrice, promotionText: switches2[index].promoText,  backDescriptionChoice: "sock", country: switches2[index].country)
                            }
                        }
                    }
                    .padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct SwitchesCollection_Previews: PreviewProvider {
    static var previews: some View {
        SwitchesCollection(switches: [[String : Any]](), switches2: [Socket]())
    }
}
