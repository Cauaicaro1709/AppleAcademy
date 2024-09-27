import SwiftUI

@Observable
class RotaContentView: Identifiable {
    let id = UUID()
    var nome: String
    var lugares: [Lugar]
    var isPinned: Bool
    
    init(nome: String, lugares: [Lugar] = []) {
        self.nome = nome
        self.lugares = lugares
        self.isPinned = false
    }
}

@Observable
class AppState {
    var rotas: [RotaContentView] = []
}

import SwiftUI
struct ContentView: View {
    
    @State var appState = AppState()
    
    var body: some View {
        TabView{
            ExplorarView()
                .tabItem{
                    Label("Explorar", systemImage:"map")
                }
            MinhasRotasView()
                .tabItem{
                    Label("Minhas rotas", systemImage:"square.grid.2x2.fill")
                }
            RotasProntasView()
                .tabItem{
                    Label("Rotas prontas", systemImage:"location.north.circle")
                }
//            PerfilView()
//                .tabItem{
//                    Label("Perfil", systemImage:"person.crop.circle.fill")
//                }
            }
            .accentColor(.green)
            .environment(appState)
        }
    }

#Preview {
    ContentView()
}
