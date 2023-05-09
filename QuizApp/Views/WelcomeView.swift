import SwiftUI

struct WelcomeView: View {
    @State var selectedTab: Int = 0
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("Beige"))
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("BlackText").opacity(0.8))
    }
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView().tabItem{
                Image(systemName: "house")
                Text("Inicio")
            }.tag(0)
            ProfileView().tabItem{
                Image(systemName: "person")
                Text("Perfil")
            }.tag(1)
        }
        .accentColor(Color("WhiteBackground"))
        .navigationBarHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
