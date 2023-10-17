//
//  ContentView.swift
//  Goods
//
//  Created by Artiom Porcescu on 21.09.2023.
//

import SwiftUI
import Marquee

struct ListItemView: View {
    
    @State private var isFlipped = true // set to false to make price black
    @State var name: String
    @State var actualPrice: Double
    @State var promoPrice: Double?
    @State var promotionText: String?
    @State var backDescriptionChoice: String
    @State var w: String?
    @State var socle: String?
    @State var k: String?
    @State var v: String?
    @State var country: String?

    var body: some View {
        
        VStack(alignment: .leading) {
            
            if isFlipped {
                FrontImageView(isFlipped: $isFlipped, promotionText: $promotionText) // promo is optional param
                    .transition(.scale)
            } else {
                BackDescription(backDescriptionChoice: $backDescriptionChoice, isFlipped: $isFlipped, w: $w, socle: $socle, k: $k, v: $v, country: $country)
                    .transition(.scale)
            }
            
            VStack {
                Text(name)
                    .frame(width: 170, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .font(.system(size: 15))

                if (promoPrice != 0.0) {
                    HStack {
                        Text(String(format: "%.2f ЛЕЙ", promoPrice ?? "0.00"))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        
                        Text(String(format: "%.2f", actualPrice))
                            .font(.caption)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .padding(.top, 2)
                                    .foregroundColor(.red),
                                alignment: .center
                            )
                    }.frame(width: 170, alignment: .leading)
                } else {
                    HStack {
                        Text(String(format: "%.2f ЛЕЙ", actualPrice))
                            .fontWeight(.bold)
                    }.frame(width: 170, alignment: .leading)
                }
                
                HStack {
                    Button(action: {
                        
                    }) {
                        
                        HStack {
                            Image(systemName: "cart.fill")
                                .foregroundColor(.white)
                            Text("КУПИТЬ")
                                .foregroundColor(.white)
                        }.frame(maxWidth: .infinity)
                    }.padding(10)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                .frame(width: 170, height: 30)
            }
        }
        .padding()
    }
}

#Preview {
    ListItemView(name: "FN LB-92, A60, E-27/ 10W/12LED, 6400K", actualPrice: 56.75, promotionText: "Hello", backDescriptionChoice: "socks")
}

struct FrontImageView: View {
    @Binding var isFlipped: Bool
    @Binding var promotionText: String?
    
    var body: some View {
        VStack {
            Image("feron")
                .resizable()
                .scaledToFill()
                .frame(width: 170, height: 170)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                        .background(
                            Image("feron")
                                .resizable()
                                .scaledToFill()
                        )
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
                .overlay(
                    HStack {
                        PromoTextView(promotionText: $promotionText)
                        Spacer()
                        Button(action: {
                            withAnimation(Animation.easeInOut(duration: 0.3).delay(0.3)) {
                                isFlipped.toggle()
                            }
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.green)
                                .padding(.trailing, 3)
                                .padding(.top, 3)
                                .font(.system(size: 25))
                        }
                    }
                    .offset(y: -70)
                )

        }
    }
}

struct BackDescription: View {
    
    @Binding var backDescriptionChoice: String
    
    @Binding var isFlipped: Bool // Add a binding to control the flip animation
    @Binding var w: String?
    @Binding var socle: String?
    @Binding var k: String?
    @Binding var v: String?
    @Binding var country: String?
    
    var lampString: String {
        return """
        Цоколь: \(socle ?? "-")
        Напряжение: \(v ?? "-")
        Мощность: \(w ?? "-")
        Цветность: \(k ?? "-")
        Страна: \(country ?? "-")
        """
    }
    
    var socketSwitchString: String {
        return """
        Страна: \(country ?? "-")
        """
    }
    
    var body: some View {
        VStack() {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.white)
                        .font(Font.title.weight(.bold))
                }.opacity(0)
                .disabled(true)
                
                Spacer()
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.3).delay(0.3)) {
                        isFlipped.toggle()
                    }
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 25))
                        .padding(.trailing, -5)
                }
            }
            Spacer()
            if backDescriptionChoice == "lamp" {
                Text(lampString)
            } else {
                Text(socketSwitchString)
            }
            
            Spacer()
        }
        .frame(width: 155, height: 250)
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(.black)
        )
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

struct PromoTextView: View {
    @Binding var promotionText: String?
    
    var body: some View {
        
        if promotionText != "" {
            ZStack {
                Capsule()
                    .fill(Color(.red))
                    .frame(width: 60, height: 25)
                    .padding(3)
                Marquee {
                    Text(promotionText ?? "Скидка")
                        .fixedSize()
                        .padding(3)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        
                    
                }.frame(width: 60, height: 25)
                    .marqueeDuration(3)
                
            }
        }
    }
}
