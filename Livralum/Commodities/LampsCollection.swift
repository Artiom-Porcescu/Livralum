//
//  GoodsCollection.swift
//  Goods
//
//  Created by Artiom Porcescu on 23.09.2023.
//

import SwiftUI

struct LampsCollection: View {
    
    @State var lamps: [[String : Any]]
    @State var lamps2: [Lamp]
    
    var body: some View {
        NavigationView {
            VStack(spacing: -10) {
                UpperNavigation(navTitle: "Лампы")
                    .onAppear {
                        Task {
                            lamps = try await GoodsVM.fetchAllGoods(for: "lamps")
                            for item in lamps {
                                lamps2.append(Lamp(w: item["w"] as! String, socle: item["socle"] as! String, promoText: item["promoText"] as! String, promoPrice: item["promoPrice"] as! Double, actualPrice: item["actualPrice"] as! Double, itemName: item["itemName"] as! String, k: item["k"] as! String, v: item["v"] as! String, country: item["manufacturer"] as! String))
                                print("Lamp Item \(item)\n\n")
                            }
                            print("Lamps: \(lamps2)")
                        }
                    }

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                        ForEach(0...lamps2.count, id: \.self) { index in
                            if index < lamps2.count {
                                ListItemView(name: lamps2[index].itemName, actualPrice: lamps2[index].actualPrice, promoPrice: lamps2[index].promoPrice, promotionText: lamps2[index].promoText,  backDescriptionChoice: "lamp", w: lamps2[index].w, socle: lamps2[index].socle, k: lamps2[index].k, v: lamps2[index].v, country: lamps2[index].country)
                            }
                        }
                    }
                    .padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct GoodsCollection_Previews: PreviewProvider {
    static var previews: some View {
        LampsCollection(lamps: [[String : Any]](), lamps2: [Lamp]())
    }
}
