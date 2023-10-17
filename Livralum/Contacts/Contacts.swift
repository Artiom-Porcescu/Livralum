//
//  Contacts.swift
//  Goods
//
//  Created by Artiom Porcescu on 06.10.2023.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct Contacts: View {
    
    var phoneNumber = "+37360644544"
    var emailAddress = "inalan@list.ru"
    
    let annotations = [
            Location(name: "Livralum", coordinate: CLLocationCoordinate2D(latitude: 47.0033469, longitude: 28.8693013))
        ]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.0033469, longitude: 28.8693013), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.005))
    
    var body: some View {
        NavigationView {
            VStack(spacing: -10) {
                UpperNavigation(navTitle: "Контакты")
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "phone.circle.fill").renderingMode(.original)
                            .font(Font.system(size: 25))
                        Text("Телефон: ").bold()
                        Link(destination: URL(string: "tel://\(phoneNumber)")!) {
                            Text(phoneNumber)
                                .foregroundColor(.black)
                                .overlay(
                                    Rectangle() // Add a custom Rectangle
                                        .frame(height: 2) // Adjust the height for thicker underline
                                        .foregroundColor(.black) // Adjust the color
                                        .offset(y: 10) // Adjust the vertical position
                                )
                            
                        }
                    }.padding() //Phone
                    
                    HStack {
                        Image(systemName: "envelope.fill").renderingMode(.original)
                            .font(Font.system(size: 25))
                        Text("Email: ").bold()
                        Button(action: {
                            let emailURL = URL(string: "mailto:\(emailAddress)")
                            if let emailURL = emailURL, UIApplication.shared.canOpenURL(emailURL) {
                                UIApplication.shared.open(emailURL)
                            }
                        }) {
                            Text(emailAddress)
                                .foregroundColor(.black)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(.black)
                                        .offset(y: 10)
                                )
                        }
                    }.padding() // Email
                    
                    HStack {
                        Image(systemName: "mappin.circle.fill").renderingMode(.original)
                            .font(Font.system(size: 25))
                        Text("Адрес: ").bold()
                        Text("г. Кишинев, ш. Мунчешть 77")
                            .foregroundColor(.black)
                            .overlay(
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(.black)
                                    .offset(y: 10)
                            )
                    }.padding() // Adress
                    
                    GeometryReader { geometry in
                        Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
                                    MapMarker(coordinate: annotation.coordinate, tint: .red)
                                }
                            .frame(width: min(geometry.size.width, geometry.size.height),
                                   height: min(geometry.size.width, geometry.size.height))
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 5)
                    )
                    .cornerRadius(25)
                    .aspectRatio(1.0, contentMode: .fit)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        Contacts()
    }
}
