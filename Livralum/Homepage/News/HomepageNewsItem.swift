import SwiftUI

struct HomepageNewsItem: View {
    let newsItemImage: String
    
    @State var title: String = String()
    @State var text: String = String()
    
    
    var body: some View {
        HStack(alignment: .top) {
            Image(newsItemImage)
                .resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.leading, 10)
            VStack(alignment: .leading) {
                Text(title).font(.title)
                Text(text)
            }
            Spacer() // Pushes the content to the left
        }
    }
}

struct HomepageNewsItem_Previews: PreviewProvider {
    static var previews: some View {
        HomepageNewsItem(newsItemImage: "feron", title: "New Arrivals", text: "We have new arrivals at our store. Come and see for yourself. We are waiting for you.")
    }
}
