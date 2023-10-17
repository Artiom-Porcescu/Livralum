//
//  Homepage.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI

struct Homepage: View {
    
    @State var news: [[String: Any]] = []
    @State var news2: [News] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: -10) {
                UpperNavigation(navTitle: "Главная")
                    .onAppear {
                        Task {
                            news = try await GoodsVM.fetchAllGoods(for: "news")
                            for item in news {
                                news2.append(News(title: item["title"] as! String, text: item["text"] as! String))
                            }
                        }
                    }
                
                CarouselView()
                Text("Новости").font(.system(size: 30,
                                             weight: .bold,
                                             design: .default))
                               .padding()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10)], spacing: 0) {
                        ForEach(0...news2.count, id: \.self) { index in
                            if index < news2.count {
                                HomepageNewsItem(newsItemImage: "feron", title: news2[index].title, text: news2[index].text).padding(.vertical, 10)
                            }
                        }
                    }
                    
                }
                Spacer()
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage(news: [[String : Any]](), news2: [News]())
    }
}
