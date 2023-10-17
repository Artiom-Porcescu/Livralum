//
//  PlafsCollection.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI

struct PlafsCollection: View {
    
    @State var plafs: [[String: Any]] = []
    @State var plafs2: [Socket] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: -10) {
                UpperNavigation(navTitle: "Плафоны")
                    .onAppear {
                        Task {
                            plafs = try await GoodsVM.fetchAllGoods(for: "plafs")
                            for item in plafs {
                                plafs2.append(Socket(promoText: item["promoText"] as! String, country: item["manufacturer"] as! String, itemName: item["itemName"] as! String, actualPrice: item["actualPrice"] as! Double, promoPrice: item["promoPrice"] as! Double))
                            }
                            print("Lamps: \(plafs2)")
                        }
                    }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                        ForEach(0...plafs2.count, id: \.self) { index in
                            if index < plafs2.count {
                                ListItemView(name: plafs2[index].itemName, actualPrice: plafs2[index].actualPrice, promoPrice: plafs2[index].promoPrice, promotionText: plafs2[index].promoText,  backDescriptionChoice: "sock", country: plafs2[index].country)
                            }
                        }
                    }
                    .padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct PlafsCollection_Previews: PreviewProvider {
    static var previews: some View {
        PlafsCollection(plafs: [[String : Any]](), plafs2: [Socket]())
    }
}
