import SwiftUI

enum TipoLugar: String, CaseIterable, Identifiable {
    case todos = "Todos"
    case praia = "Praia"
    case restaurante = "Restaurante"
    case cafeteria = "Café"
    case shopping = "Shopping"
    case museu = "Museu"
    case parque = "Parques"
    
    var id: String { self.rawValue }
}

@Observable
class Rota: Identifiable {
    let id = UUID()
    let nome: String
    let imagem: String
    let tipo: TipoLugar
    var lugares: [Lugar]
    
    init(nome: String, imagem: String, tipo: TipoLugar, lugares: [Lugar]) {
        self.nome = nome
        self.imagem = imagem
        self.tipo = tipo
        self.lugares = lugares
    }
}

struct ExplorarView: View {
    @State private var searchText = ""
    @State private var filtroSelecionado: TipoLugar = .todos
    
    let lugares = [
        Lugar(nome: "Parque Adahil Barreto", imagem: "ParqueAdahilBarreto", tipo: .parque),
        Lugar(nome: "Café Cultive", imagem: "CafeCultive", tipo: .cafeteria),
        Lugar(nome: "Praia do Náutico", imagem: "PraiaDoNautico", tipo: .praia),
        Lugar(nome: "Museu da Imagem e Som", imagem: "MuseuImagemSom", tipo: .museu),
        Lugar(nome: "Carbone SteakHouse", imagem: "CarboneSteakhouse", tipo: .restaurante),
        Lugar(nome: "Parque Estadual do Coco", imagem: "ParqueCoco", tipo: .parque),
        Lugar(nome: "Mandir Restaurante Vegano", imagem: "MandirVegano", tipo: .restaurante),
        Lugar(nome: "Pizzaria do 10", imagem: "Pizzaria10", tipo: .restaurante),
        Lugar(nome: "Museu do Automóvel", imagem: "MuseuAutomovel", tipo: .museu),
        Lugar(nome: "Cervejaria Portuguesa", imagem: "CervejariaPort", tipo: .restaurante),
        Lugar(nome: "Praia de Iracema", imagem: "PraiaDeIracema", tipo: .praia),
        Lugar(nome: "Santa Grelha", imagem: "SantaGrelha", tipo: .restaurante),
        Lugar(nome: "Shopping Parangaba", imagem: "Parangaba", tipo: .shopping),
        Lugar(nome: "Café Viriato", imagem: "CafeViriato", tipo: .cafeteria),
        Lugar(nome: "Parque Bisão", imagem: "ParqueBisao", tipo: .parque),
        Lugar(nome: "Museu da Arte Contemporânea", imagem: "MuseuComp", tipo: .museu),
        Lugar(nome: "Giz Cozinha Boêmia", imagem: "GizBoemia", tipo: .restaurante),
        Lugar(nome: "Le Pain Le Café", imagem: "LePainLeCofe", tipo: .cafeteria),
        Lugar(nome: "Complexo Cultural Estação das Artes", imagem: "EstacaoArtes", tipo: .museu),
        Lugar(nome: "Praia do Futuro", imagem: "PraiaDoFuturo", tipo: .praia),
        Lugar(nome: "Amika Coffehouse", imagem: "Amika", tipo: .cafeteria),
        Lugar(nome: "Parque da Liberdade", imagem: "ParqueLiberdade", tipo: .parque),
        Lugar(nome: "Café Arretado", imagem: "CafeArretado", tipo: .cafeteria),
        Lugar(nome: "Museu da Fotografia", imagem: "MuseuFotografia", tipo: .museu),
        Lugar(nome: "Shopping RioMar Kennedy", imagem: "Kennedy", tipo: .shopping),
        Lugar(nome: "Cortile Ristorante", imagem: "Cortile", tipo: .restaurante),
        Lugar(nome: "Cidade da Criança", imagem: "PracaCrianca", tipo: .parque),
        Lugar(nome: "Bleecker Café", imagem: "Bleeckr", tipo: .cafeteria),
        Lugar(nome: "Restaurante Varanda Tropical", imagem: "VarandaTropical", tipo: .restaurante),
        Lugar(nome: "Museu do Humor Cearense", imagem: "MuseuHumor", tipo: .museu),
        Lugar(nome: "Ecopoint", imagem: "Ecopoint", tipo: .parque),
        Lugar(nome: "Balcone Restô", imagem: "Balcone", tipo: .restaurante),
        Lugar(nome: "Museu da Cultura Cearense", imagem: "CulturaCearense", tipo: .museu),
        Lugar(nome: "Le Bloc Café", imagem: "LeBloc", tipo: .cafeteria),
        Lugar(nome: "Shopping RioMar Fortaleza", imagem: "RioMarFortal", tipo: .shopping),
        Lugar(nome: "Consulado Café", imagem: "Consulado", tipo: .cafeteria),
        Lugar(nome: "Pinacoteca do Ceará", imagem: "Pinacoteca", tipo: .museu),
        Lugar(nome: "Shopping Via Sul", imagem: "ViaSul", tipo: .shopping),
        Lugar(nome: "Praia do Meireles", imagem: "Meireles", tipo: .praia),
        Lugar(nome: "Amigos Pizzaria", imagem: "AmigosPizzaria", tipo: .restaurante),
        Lugar(nome: "Bar Chá da Égua", imagem: "BarCha", tipo: .restaurante),
        Lugar(nome: "Museu da Escrita", imagem: "MuseuEscrita", tipo: .museu),
        Lugar(nome: "Seu Conrado Cozinha Brasileira", imagem: "SeuConrado", tipo: .restaurante),
        Lugar(nome: "Mangue Azul", imagem: "MangueAzul", tipo: .restaurante),
        Lugar(nome: "Shopping Benfica", imagem: "Benfica", tipo: .shopping),
        Lugar(nome: "Museu de Arte da Universidade Federal do Ceará", imagem: "MuseuUFC", tipo: .museu),
        Lugar(nome: "Torra Café", imagem: "TorraCafe", tipo: .cafeteria),
        Lugar(nome: "Shopping Iguatemi Bosque", imagem: "Iguatemi", tipo: .shopping),
        Lugar(nome: "Centro das Tapioqueiras", imagem: "CentroTapioqueiras", tipo: .restaurante),
        Lugar(nome: "Parque Parreão ", imagem: "ParqueParreao", tipo: .parque),
        
    ]
    
    var filteredLugares: [Lugar] {
        lugares.filter { (filtroSelecionado == .todos || $0.tipo == filtroSelecionado) &&
                         (searchText.isEmpty || $0.nome.lowercased().contains(searchText.lowercased())) }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                ScrollView {
                    LazyVStack(spacing: 10, pinnedViews: .sectionHeaders) {
                        Section {
                            ForEach(filteredLugares) { lugar in
                                NavigationLink(destination: DetalhesCardView(lugar: lugar)) {
                                    CardView(imageName: lugar.imagem, text: lugar.nome)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        } header: {
                            
                            // Fixar a FilterBar
                            FilterBar(selectedFilter: $filtroSelecionado)
                                .background(Color.white)
                        }
                    }
                }
            }
            .navigationTitle("Explorar")
        }
        .searchable(text: $searchText, prompt: "Pesquisar locais")
    }
}

struct ExplorarView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorarView()
    }
}


