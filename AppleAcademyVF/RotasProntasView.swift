import SwiftUI
import MapKit

// MARK: - Modelos

struct RotasProntas: Identifiable {
    let id = UUID()
    let nome: String
    let imagem: String
    let descricao: String
}

// Estrutura para representar os locais que serão marcados no mapa
struct Local: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let nome: String
    let descricao: String
}

// MARK: - ViewModel

class RotasViewModel: ObservableObject {
    @Published var rotas: [RotasProntas] = [
        RotasProntas(nome: "Rota Gastronômica", imagem: "ParqueAdahilBarreto", descricao: "Nesta rota você vai visitar os melhores restaurantes de Fortaleza e conhecer nossa culinária."),
        RotasProntas(nome: "Rota Cultural", imagem: "ruth", descricao: "Nesta rota você vai conhecer os principais pontos culturais de Fortaleza."),
        RotasProntas(nome: "Rota Praias", imagem: "victor", descricao: "Nesta rota você vai descobrir as praias mais bonitas de Fortaleza enquanto aproveita um belo dia de sol."),
        RotasProntas(nome: "Rota Diversão", imagem: "cinema", descricao: "Uma rota cheia de lugares legais, com cinemas, restaurantes e muita diversão."),
        RotasProntas(nome: "Rota Noturna", imagem: "ariana", descricao: "Uma rota especial para aproveitar a vida noturna de Fortaleza.")
    ]
}

// MARK: - Views

struct RotasProntasView: View {
    @StateObject private var viewModel = RotasViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.rotas) { rota in
                        NavigationLink(destination: DetalhesRotaView(rota: rota)) {
                            RotaRow(rota: rota)
                                .padding(.horizontal)
                        }
                        Divider()
                            .padding(.leading, 16)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Rotas Prontas")
        }
    }
}

struct RotaRow: View {
    let rota: RotasProntas
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(rota.imagem)
                .resizable()
                .scaledToFill()
                .frame(width: 135, height: 135)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(rota.nome)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(rota.descricao)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 10)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct DetalhesRotaView: View {
    let rota: RotasProntas
    
    var body: some View {
        VStack {
            ScrollView {
                Image(systemName: iconForRota(rota.nome))
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.top, 10)
                
                Text(rota.nome)
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.top, 4)
                    .padding(.bottom, 4)
                
                VStack(spacing: 16) {
                    if rota.nome == "Rota Gastronômica" {
                        CardView(imageName: "Ruth", text: "Café do Mercado")
                        CardView(imageName: "Victor", text: "Restaurante O Casarão")
                        CardView(imageName: "Gustavo", text: "Lanchonete Moinho do Tempo")
                        CardView(imageName: "Gustavo", text: "Padaria Pão de Açúcar")
                        CardView(imageName: "Gustavo", text: "Cervejaria Artesanal Foliões")
                        
                    } else if rota.nome == "Rota Cultural" {
                        CardView(imageName: "Museu1", text: "Museu da Imagem e do Som")
                        CardView(imageName: "Museu2", text: "Museu do Ceára")
                        CardView(imageName: "Museu3", text: "Restaurante do Museu do Ceára")
                        CardView(imageName: "Museu3", text: "Centro Cultural Dragão do Mar")
                        CardView(imageName: "Museu3", text: "Coco Bambu")
                        
                    } else if rota.nome == "Rota Praias" {
                        CardView(imageName: "Praia3", text: "Café do Mercado")
                        CardView(imageName: "Praia1", text: "Praia do Futuro")
                        CardView(imageName: "Praia2", text: "Barraca do Mago")
                        CardView(imageName: "Praia3", text: "Praia do Náutico")
                        CardView(imageName: "Praia3", text: "O pescador")
                        
                    } else if rota.nome == "Rota Diversão" {
                        CardView(imageName: "Cinema2", text: "Giraffas")
                        CardView(imageName: "Cinema1", text: "Cinemark")
                        CardView(imageName: "Restaurante1", text: "Playground Shopping RioMar")
                        CardView(imageName: "Cinema2", text: "Spoleto")
                    
                    } else if rota.nome == "Rota Noturna" {
                        CardView(imageName: "CasaShow", text: "Cine Jóia")
                        CardView(imageName: "Bar1", text: "Café do Mercadp")
                        CardView(imageName: "Bar2", text: "Cozinha da Nonna")
                        CardView(imageName: "CasaShow", text: "Bar Farra")
                        CardView(imageName: "CasaShow", text: "Pavilhão da Cultura Cearense")
                    }
                }
                .padding()
            }
            
            NavigationLink(destination: MapaRotaView(rota: rota)) {
                Text("Montar Rota")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .navigationTitle("")
    }
    
    func iconForRota(_ nome: String) -> String {
        switch nome {
        case "Rota Gastronômica":
            return "fork.knife"
        case "Rota Cultural":
            return "book.fill"
        case "Rota Praias":
            return "sun.max.fill"
        case "Rota Noturna":
            return "moon.stars"
        case "Rota de Entretenimento":
            return "film"
        default:
            return "mappin.and.ellipse"
        }
    }
}

struct MapaRotaView: View {
    let rota: RotasProntas
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -3.7327, longitude: -38.5270),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @State private var selectedLocal: Local? // Para armazenar o local selecionado
    
    var locais: [Local] {
        switch rota.nome {
        case "Rota Gastronômica":
            return [
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.725, longitude: -38.530), nome: "Café do Mercado", descricao: "Um ótimo café."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.729, longitude: -38.523), nome: "Restaurante O Casarão", descricao: "Delícias da culinária local."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.722, longitude: -38.533), nome: "Lanchonete Moinho do Tempo", descricao: "Lanches variados.")
            ]
        case "Rota Cultural":
            return [
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.730, longitude: -38.531), nome: "Museu da Imagem e do Som", descricao: "Um museu dedicado à cultura."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.731, longitude: -38.529), nome: "Museu do Ceará", descricao: "História do Ceará."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.732, longitude: -38.528), nome: "Restaurante do Museu do Ceará", descricao: "Comida típica no museu.")
            ]
        case "Rota Praias":
            return [
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.735, longitude: -38.527), nome: "Praia do Futuro", descricao: "Uma das praias mais famosas."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.737, longitude: -38.524), nome: "Barraca do Mago", descricao: "Barraca famosa na Praia do Futuro."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.739, longitude: -38.520), nome: "Praia do Náutico", descricao: "Praia tranquila e bonita.")
            ]
        case "Rota Diversão":
            return [
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.740, longitude: -38.530), nome: "Cinemark", descricao: "Cinema popular."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.741, longitude: -38.525), nome: "Restaurante no Shopping", descricao: "Vários restaurantes."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.742, longitude: -38.523), nome: "Giraffas", descricao: "Rede de fast-food.")
            ]
        case "Rota Noturna":
            return [
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.745, longitude: -38.530), nome: "Cine Jóia", descricao: "Cinema tradicional."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.746, longitude: -38.525), nome: "Café do Mercado", descricao: "Café famoso na região."),
                Local(coordinate: CLLocationCoordinate2D(latitude: -3.747, longitude: -38.523), nome: "Bar Farra", descricao: "Bar animado.")
            ]
        default:
            return []
        }
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locais) { local in
            MapAnnotation(coordinate: local.coordinate) {
                Button(action: {
                    selectedLocal = local // Atualiza o local selecionado
                }) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.red)
                        .font(.title)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .alert(item: $selectedLocal) { local in
            Alert(
                title: Text(local.nome),
                message: Text(local.descricao),
                dismissButton: .default(Text("Fechar"))
            )
        }
    }
}

// MARK: - Views auxiliares para Cards

struct CardRotasView: View {
    let imageName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(6)
                .padding(.trailing, 10)
            Text(text)
                .font(.body)
                .foregroundColor(.black)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

// MARK: - Previews

struct RotasProntasView_Previews: PreviewProvider {
    static var previews: some View {
        RotasProntasView()
    }
}

