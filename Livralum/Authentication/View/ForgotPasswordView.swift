//
//  ForgotPasswordView.swift
//  Livralum
//
//  Created by Artiom Porcescu on 12.10.2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email = ""
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                TextFieldView(text: $email,
                              title: "Email",
                              placeholder: "name@example.com")
                .autocapitalization(.none)
                .padding(.top, 50)
                
                Button {
                    print("Hello")
                } label: {
                    Text("ОТПРАВИТЬ")
                        .frame(width: 250, height: 40)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .background(Color("authColors"))
                        .cornerRadius(35)
                }
                
                Spacer()
            }.padding(.horizontal)
        }.accentColor(Color("authColors"))
    }
}

#Preview {
    ForgotPasswordView()
}
