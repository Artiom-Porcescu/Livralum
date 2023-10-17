//
//  RegistrationView.swift
//  Livralum
//
//  Created by Artiom Porcescu on 12.10.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
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
            
            TextFieldView(text: $confirmPassword,
                          title: "Подтвердитe пароль",
                          placeholder: "••••••••",
                          isSecureTextEntry: true)
            .autocapitalization(.none)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password)
                }
            } label: {
                Text("СОЗДАТЬ АККАУНТ")
                    .frame(width: 250, height: 40)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .background(Color("authColors"))
                    .cornerRadius(35)
            }
            
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    RegistrationView()
}
