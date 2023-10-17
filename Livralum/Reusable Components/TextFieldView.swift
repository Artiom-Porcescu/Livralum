//
//  TextFieldView.swift
//  Livralum
//
//  Created by Artiom Porcescu on 12.10.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureTextEntry = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .foregroundColor(Color("authColors"))
                .fontWeight(.semibold)
            
            if isSecureTextEntry {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 15))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 15))
            }
            
            Divider()
        }
    }
}

#Preview {
    TextFieldView(text: .constant(""), title: "Email", placeholder: "email@example.com")
}
