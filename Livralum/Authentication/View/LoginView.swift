//
//  LoginView.swift
//  Livralum
//
//  Created by Artiom Porcescu on 12.10.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                TextFieldView(text: $email,
                              title: "Email",
                              placeholder: "name@example.com")
                .autocapitalization(.none)
                .padding(.top, 50)
                
                TextFieldView(text: $password,
                              title: "Пароль",
                              placeholder: "••••••••",
                              isSecureTextEntry: true)
                .autocapitalization(.none)
                
                HStack {
                    Spacer()
                    VStack {
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Забыли пароль?")
                                .frame(width: 150, height: 30)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(Color("authColors"))
                        }
                        Rectangle()
                            .frame(width: 130,height: 2)
                                        .foregroundColor(Color("authColors"))
                                        .offset(y: -15)
                    }
                    
                }
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    Text("ВОЙТИ")
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
    LoginView()
}
