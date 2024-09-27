import SwiftUI

struct Lugar: Identifiable {
    let id = UUID()
    let nome: String
    let imagem: String
    let tipo: TipoLugar
    
}

