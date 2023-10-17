import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        
        
        NavigationView {
            VStack(spacing: 20) {
                Image("logoLivra")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                MainMenuBtn(name: "ВХОД", destination: LoginView())
                
                MainMenuBtn(name: "РЕГИСТРАЦИЯ", destination: RegistrationView())
            }
        }.accentColor(Color("authColors"))
    }
}

#Preview {
        WelcomeView()
}


