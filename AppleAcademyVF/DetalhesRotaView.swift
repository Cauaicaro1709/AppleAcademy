import SwiftUI

struct DetalhesRotaView: View {
    var rota: Rota
    
    var body: some View {
        VStack {
            Text(rota.nome)
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text(rota.descricao)
                .font(.body)
                .padding()
            
            List {
                // Exemplos de pontos de interesse
                ForEach(["Ponto de Interesse 1", "Ponto de Interesse 2"], id: \.self) { ponto in
                    HStack {
                        Image(rota.imagem)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                        Text(ponto)
                            .font(.headline)
                    }
                }
            }
            
            NavigationLink(destination: MapaRotaView()) {
                Text("Montar Rota")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()
            }
        }
        .navigationTitle(rota.nome)
    }
}

struct DetalhesRotaView_Previews: PreviewProvider {
    static var previews: some View {
        DetalhesRotaView(rota: Rota(nome: "Rota Gastronômica", imagem: "gastronomica", descricao: "Descrição da rota"))
    }
}

