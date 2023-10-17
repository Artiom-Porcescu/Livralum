//
//  SocketsCollection.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI

struct SocketsCollection: View {
    
    @State var sockets: [[String: Any]] = []
    @State var sockets2: [Socket] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: -10) {
                UpperNavigation(navTitle: "Розетки")
                    .onAppear {
                        Task {
                            sockets = try await GoodsVM.fetchAllGoods(for: "socks")
                            for item in sockets {
                                sockets2.append(Socket(promoText: item["promoText"] as! String, country: item["manufacturer"] as! String, itemName: item["itemName"] as! String, actualPrice: item["actualPrice"] as! Double, promoPrice: item["promoPrice"] as! Double))
                                print("Sock Item: \(item)\n\n")
                            }
                            print("Sockets: \(sockets)")
                        }
                    }

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                        ForEach(0...sockets2.count, id: \.self) { index in
                            if index < sockets2.count {
                                ListItemView(name: sockets2[index].itemName, actualPrice: sockets2[index].actualPrice, promoPrice: sockets2[index].promoPrice, promotionText: sockets2[index].promoText,  backDescriptionChoice: "sock", country: sockets2[index].country)
                            }
                        }
                    }
                    .padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct SocketsCollection_Previews: PreviewProvider {
    static var previews: some View {
        SocketsCollection(sockets: [[String : Any]](), sockets2: [Socket]())
    }
}
