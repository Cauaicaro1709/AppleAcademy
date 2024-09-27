import SwiftUI

struct FilterBar: View {
    @Binding var selectedFilter: TipoLugar
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(TipoLugar.allCases) { tipo in
                    Button(action: {
                        selectedFilter = tipo
                    }) {
                        Text(tipo.rawValue)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(selectedFilter == tipo ? Color(red: 0.169, green: 0.377, blue: 0.301) : Color.green.opacity(0.2))
                            .foregroundColor(selectedFilter == tipo ? .white : .black)
                            .cornerRadius(15)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal) // Adiciona padding horizontal
            .padding(.vertical, 8) // Adiciona padding vertical
        }
        .background(Color.white) // Define um fundo branco
        .padding(.horizontal) // Limita o fundo da barra de filtros dentro da view
    }
}

