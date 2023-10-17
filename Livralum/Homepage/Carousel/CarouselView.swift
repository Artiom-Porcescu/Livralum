//
//  CarouselView.swift
//  Goods
//
//  Created by Artiom Porcescu on 09.10.2023.
//

import SwiftUI

struct CarouselView: View {
    @State private var index = 0
    let totalImages = 3 // Update this to the total number of images you have!!!!!!!!
    let timerInterval = 5.0 // 1 second interval

    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(0..<totalImages, id: \.self) { _ in
                    ImageView(imageName: "carousel")
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            HStack(spacing: 10) {
                ForEach(0..<totalImages, id: \.self) { imageIndex in
                    Rectangle()
                        .fill(imageIndex == self.index ? Color("sideMenu") : Color("sideMenu").opacity(0.5))
                        .frame(height: imageIndex == self.index ? 7 : 5)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .onAppear {
            startTimer()
        }
        .frame(height: 260)
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { _ in
            withAnimation {
                index = (index + 1) % totalImages
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}

struct ImageView: View {
    
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding()
            .padding(.bottom, -20)
            
    }
}


