import SwiftUI

// Definição do modelo Lugar e TipoLugar
struct LugarDetalhesCard{
    let nome: String
    let imagem: String
    let tipo: TipoLugarDetalhes
}

enum TipoLugarDetalhes {
    case praia
    case parque
    case museu
}

// Definição das estruturas Avaliacao e Foto
struct Avaliacao: Identifiable {
    let id = UUID()
    let nome: String
    let comentario: String
    let imagem: String
    let rating: Int
}

struct Foto: Identifiable {
    let id = UUID()
    let imagem: String
    let descricao: String
}

struct DetalhesCardView: View {
    let lugar: Lugar
    
    @State private var selectedTab: String = "Sobre"
    @State private var showingSheet: Bool = false  // Estado para controlar a apresentação do sheet
    
    var avaliacoes: [Avaliacao] {
        switch lugar.nome {
        case "Praia do Futuro":
            return [
                Avaliacao(nome: "João", comentario: "Ótima praia, muito limpa e com boa estrutura.", imagem: "joao", rating: 5),
                Avaliacao(nome: "Maria", comentario: "Excelente para passar o dia com a família!", imagem: "maria", rating: 4),
                Avaliacao(nome: "Ana", comentario: "Acessibilidade é boa, com calçadas largas e rampas, mas a areia pode ser um desafio.", imagem: "ana", rating: 3),
                Avaliacao(nome: "Carlos", comentario: "Praia bonita, mas faltam opções de cadeiras de rodas na areia.", imagem: "carlos", rating: 2),
                Avaliacao(nome: "Sofia", comentario: "As barracas têm boas adaptações, mas o acesso à água é difícil.", imagem: "sofia", rating: 3)
            ]
        case "Parque Adahil Barreto":
            return [
                Avaliacao(nome: "Diego Richardson", comentario: "Tem campo de futebol, playground, trilha, e muitos brinquedos para criançada. Tem lugar para estacionar do lado de fora.", imagem: "joao", rating: 4),
                Avaliacao(nome: "Leideane Amorin", comentario: "Lugar ótimo para passeio em família com boa estrutura e muito arborizado", imagem: "joao", rating: 5),
                Avaliacao(nome: "Jose Eudes", comentario: "Gostei demais, muito espaço verde, calmo e com prestação de serviços grátis", imagem: "joao", rating: 4),
                Avaliacao(nome: "Paula", comentario: "O parque é bem acessível, com rampas e caminhos de fácil acesso.", imagem: "paula", rating: 4),
                Avaliacao(nome: "Ricardo", comentario: "Ótimo lugar, mas algumas áreas ainda precisam de melhorias na acessibilidade.", imagem: "ricardo", rating: 3)
            ]
        case "Café Cultive":
            return [
                Avaliacao(nome: "Felipe", comentario: "Café aconchegante com boas opções. Acessibilidade adequada.", imagem: "felipe", rating: 5),
                Avaliacao(nome: "Julia", comentario: "Ambiente agradável, mas a entrada poderia ser mais acessível.", imagem: "julia", rating: 4),
                Avaliacao(nome: "Roberto", comentario: "O espaço é amplo, mas precisa de mais atenção na sinalização para cadeirantes.", imagem: "roberto", rating: 3),
                Avaliacao(nome: "Mariana", comentario: "Atendimento excelente, mas as mesas poderiam ser mais espaçadas para facilitar o acesso.", imagem: "mariana", rating: 4),
                Avaliacao(nome: "Lucas", comentario: "O café é ótimo, mas a rampa de acesso não é muito larga.", imagem: "lucas", rating: 3)
            ]
        case "Museu da Imagem e Som":
            return [
                Avaliacao(nome: "Luiza", comentario: "Ótima estrutura para visitantes com mobilidade reduzida.", imagem: "luiza", rating: 5),
                Avaliacao(nome: "Fernando", comentario: "Muito bom, mas o acesso ao andar superior é complicado.", imagem: "fernando", rating: 3),
                Avaliacao(nome: "Marcos", comentario: "Exposições interessantes e boa acessibilidade nas áreas principais.", imagem: "marcos", rating: 4),
                Avaliacao(nome: "Tatiane", comentario: "Faltam algumas adaptações em certas salas, mas no geral, é acessível.", imagem: "tatiane", rating: 3)
            ]
        case "Carbono SteakHouse":
            return [
                Avaliacao(nome: "Marta", comentario: "O restaurante é acessível e o atendimento é ótimo.", imagem: "marta", rating: 5),
                Avaliacao(nome: "Gustavo", comentario: "Boa comida, mas o estacionamento poderia ter mais vagas para cadeirantes.", imagem: "gustavo", rating: 4),
                Avaliacao(nome: "Ricardo", comentario: "Ambiente acolhedor e acessível, com boas opções no cardápio.", imagem: "ricardo", rating: 4),
                Avaliacao(nome: "Fernanda", comentario: "Acessibilidade boa, mas poderia ter mais espaço entre as mesas.", imagem: "fernanda", rating: 3)
            ]
        case "Parque estadual do Cocó":
            return [
                Avaliacao(nome: "Samuel", comentario: "Excelente lugar para caminhar e relaxar, com boas opções de acessibilidade.", imagem: "samuel", rating: 5),
                Avaliacao(nome: "Viviane", comentario: "Algumas trilhas são mais difíceis, mas as áreas principais são bem acessíveis.", imagem: "viviane", rating: 4),
                Avaliacao(nome: "Paulo", comentario: "Fiquei satisfeito com a acessibilidade em geral, mas um pouco de sinalização extra ajudaria.", imagem: "paulo", rating: 4)
            ]
        case "Mandir Restaurante Vegano":
            return [
                Avaliacao(nome: "Jéssica", comentario: "Ótima comida vegana e acessibilidade boa.", imagem: "jessica", rating: 5),
                Avaliacao(nome: "Henrique", comentario: "Ambiente acolhedor, mas a entrada poderia ser mais acessível.", imagem: "henrique", rating: 4),
                Avaliacao(nome: "Luana", comentario: "Acessibilidade razoável, mas a rampa é um pouco íngreme.", imagem: "luana", rating: 3)
            ]
        case "Pizzaria do 10":
            return [
                Avaliacao(nome: "Felipe", comentario: "As pizzas são maravilhosas e o lugar é acessível.", imagem: "felipe", rating: 5),
                Avaliacao(nome: "Clara", comentario: "Bom atendimento e acessibilidade adequada.", imagem: "clara", rating: 4),
                Avaliacao(nome: "Rodrigo", comentario: "O acesso é bom, mas o banheiro poderia ter adaptações.", imagem: "rodrigo", rating: 3)
            ]
        case "Museu do Automóvel":
            return [
                Avaliacao(nome: "Carlos", comentario: "Um ótimo museu com boa acessibilidade!", imagem: "carlos", rating: 5),
                Avaliacao(nome: "Fernanda", comentario: "As exposições são muito interessantes e o acesso é tranquilo.", imagem: "fernanda", rating: 4),
                Avaliacao(nome: "Juliana", comentario: "O local é acessível, mas poderia ter mais sinalizações para cadeirantes.", imagem: "juliana", rating: 3)
            ]
        case "Cervejaria Portuguesa":
            return [
                Avaliacao(nome: "Júlio", comentario: "Ambiente muito agradável e acessível para todos.", imagem: "julio", rating: 5),
                Avaliacao(nome: "Mirella", comentario: "Boa acessibilidade, mas o estacionamento poderia ser melhor.", imagem: "mirella", rating: 4),
                Avaliacao(nome: "André", comentario: "Ambiente acolhedor, mas a entrada principal é um pouco estreita.", imagem: "andre", rating: 3)
            ]
        case "Museu da Fotografia":
            return [
                Avaliacao(nome: "Roberto", comentario: "Exposições bem organizadas e acessíveis.", imagem: "roberto", rating: 5),
                Avaliacao(nome: "Claudia", comentario: "Acessibilidade ótima, com rampas e banheiros adaptados.", imagem: "claudia", rating: 4),
                Avaliacao(nome: "Silvia", comentario: "Bom espaço, mas poderia ter mais informações sobre acessibilidade.", imagem: "silvia", rating: 3)
            ]
        case "Shopping Parangaba":
            return [
                Avaliacao(nome: "Fernando", comentario: "Ótima estrutura de acessibilidade, com banheiros adaptados e rampas.", imagem: "fernando", rating: 5),
                Avaliacao(nome: "Natalia", comentario: "Espaço amplo, mas alguns corredores são um pouco estreitos.", imagem: "natalia", rating: 4),
                Avaliacao(nome: "Bruno", comentario: "Bom shopping com acessibilidade, mas poderia ter mais opções de lazer para cadeirantes.", imagem: "bruno", rating: 3)
            ]
        case "Museu do Humor Cearense":
            return [
                Avaliacao(nome: "Adriana", comentario: "Acessibilidade boa e exposições muito divertidas.", imagem: "adriana", rating: 5),
                Avaliacao(nome: "Thiago", comentario: "Espaço bem planejado para visitantes com dificuldades de mobilidade.", imagem: "thiago", rating: 4),
                Avaliacao(nome: "Fábio", comentario: "Local acessível, mas poderia ter mais sinalizações.", imagem: "fabio", rating: 3)
           

                
            ]
        case "Parque Adahil Barreto":
            return [
                Avaliacao(nome: "Diego Richardson", comentario:"Tem campo de futebol, playground, trilha, e muitos brinquedos para criançada. Tem lugar para estacionar do lado de fora. ", imagem: "joao", rating: 4),
                Avaliacao(nome: "Leideane Amorin", comentario: "Lugar ótimo para passeio em família com boa estrutura e muito arborizado", imagem: "joao", rating: 5),
                Avaliacao(nome: "Jose Eudes", comentario: "Gostei demais, muito espaço verde, calmo e com prestação de serviços grátis", imagem: "joao", rating: 4)
            ]
        case "Café Cultive":
            return[
//                Avaliacao(nome: String, comentario: <#T##String#>, imagem: <#T##String#>, rating: <#T##Int#>)
            ]
        default:
            return []
        }
    }
    
    var fotos: [Foto] {
        switch lugar.nome {
        case "Praia do Futuro":
            return [
                Foto(imagem: "praia_do_futuro_1", descricao: "Praia ao amanhecer"),
                Foto(imagem: "praia_do_futuro_2", descricao: "Vista panorâmica das barracas")
            ]
        default:
            return []
        }
    }
    
    var descricao: String {
            switch lugar.nome {
            case "Parque Adahil Barreto":
                return "Áreas de lazer, espaço para cães e vistas para o Rio Cocó em um parque arborizado conhecido pelos piqueniques."
            case "Café Cultive":
                return "Somos o Café Cultive, lugar de cultivar momentos! Temos um cardápio super diversificado cheio de comidinhas feitas com carinho, ambiente diferenciado e um atendimento cheio de amor."
            case "Museu da Imagem e Som":
                return "O Museu da Imagem e do Som Chico Albuquerque ressurge ampliado e equipado para sua missão, com a tarefa de informar e educar com mensagens artísticas e sociais."
            case "Carbono SteakHouse":
                return "O Carbono é especializado no preparo de carnes, inspirando-se no fogo para criar experiências culturais únicas, unindo tradição e inovação."
            case "Parque estadual do Cocó":
                return "O Rio Cocó possui uma bacia hidrográfica de aproximadamente 485 km², com um rio principal de 50 km. A preservação de seu ambiente natural é prioridade."
            case "Mandir Restaurante Vegano":
                return "Cozinha informal serve menu lacto vegetariano e vegano em ambiente informal com temas da espiritualidade."
            case "Pizzaria do 10":
                return "Sabor, qualidade e preço justo."
            case "Museu do Automóvel":
                return "O Museu do Automóvel do Ceará é um museu de automóveis localizado na cidade de Fortaleza. Foi fundado em 3 de julho de 1981. A exibição de estréia contava com 35 automóveis antigos."
            case "Cervejaria Portuguesa":
                return "A Cervejaria Portuguesa, localizada em Fortaleza, oferece um ambiente acolhedor e descontraído, ideal para desfrutar de uma vasta seleção de cervejas artesanais e petiscos tradicionais. Com um cardápio diversificado e um atendimento atencioso, é o local perfeito para reunir amigos e apreciar a cultura cervejeira local."
            case "Museu da Fotografia":
                return "Seja bem-vindo ao Museu da Fotografia de Fortaleza. Aqui você acompanha tudo sobre exposições, atividades e muito mais. Funcionamos de terça a domingo das 12h às 17h."
            case "Shopping Parangaba":
                return "O Shopping Parangaba tem uma localização estratégica sendo o único shopping no Ceará conectado a um terminal de ônibus, estações de metrô e VLT."
            case "Museu do Humor Cearense":
                return "Teatro de 120 lugares dedicados ao riso e festivais do humor em prédio que abriga também o Museu do Humor."
            case "Amika Coffeehouse":
                return "Cafeteria com destaque ao café coado e na prensa francesa doces e bolos de chocolate em atmosfera tranquila."
            case "Torra Café":
                return "Café requintado com menu de bolos e sanduíches."
            case "Shopping Iguatemi":
                return "Centenas de lojas em um shopping moderno e espaçoso com fontes jardins e cinema."
            case "Shopping Riomar Fortaleza":
                return "O RioMar Fortaleza é um shopping moderno e inovador com arquitetura impressionante e um mix de 385 lojas incluindo grifes internacionais."
            case "Praia do Náutico":
                 return"A Praia do Náutico em Fortaleza é famosa por sua infraestrutura e opções de lazer, com águas calmas para banhos e esportes aquáticos. É um local vibrante, ideal para apreciar o pôr do sol e a atmosfera animada da cidade."
            case "Praia de Iracema":
                return "A Praia de Iracema, em Fortaleza, é famosa por sua beleza, infraestrutura animada e vida noturna vibrante, sendo um ponto de encontro popular para moradores e turistas. Destaca-se pelo Morro do Serrote, arte urbana e o complexo cultural Dragão do Mar."
            case "Santa Grelha":
                return "Churrascaria à la carte oferece carnes nobres, aves, pescados, vinhos e mais, em espaço rústico-contemporâneo."
            case "Café Viriato":
                return "O Café Viriato, em Fortaleza, é um espaço acolhedor famoso por seus cafés de qualidade, lanches e doces, ideal para reuniões e momentos de descontração. O local também promove eventos culturais, como apresentações musicais e exposições de arte."
            case "Parque Bisão":
                return "O Parque do Bisão, em Fortaleza, é uma área verde popular para lazer e atividades ao ar livre, com trilhas, lago e espaços para piqueniques. É um ótimo local para famílias e visitantes em busca de tranquilidade e contato com a natureza."
            case "Museu da arte Contemporânea":
                return "O Museu de Arte Contemporânea do Ceará (MAC), em Fortaleza, é um espaço dedicado à arte contemporânea, com um acervo diversificado de obras de artistas brasileiros e internacionais. Além de exposições permanentes, o museu promove eventos educativos e exposições temporárias, enriquecendo o cenário cultural da região."
            case "Giz Cozinha Boêmia":
                return "Grelhados e feijoada, além de drinques e música ao vivo, em um restaurante badalado com uma varanda arborizada."
            case "Le Pain Le Café":
                return "Variedade de doces finos, sanduíches tradicionais e da casa, cafés e drinques, em ambiente requintado."
            case "Complexo Cultural Estação das Artes":
                return "O Complexo Cultural Estação das Artes, em Fortaleza, é um espaço revitalizado que promove a cultura e as artes por meio de exposições, shows e eventos diversos. Inaugurado em 2016, ele combina arquitetura histórica e moderna, servindo como um ponto de referência cultural na cidade."
            case "Praia do Futuro":
                return "A Praia do Futuro, em Fortaleza, é famosa por suas águas quentes, barracas animadas e atividades como esportes aquáticos. Com uma vibrante vida noturna, é um destino popular para relaxar e desfrutar da culinária cearense."
            case "Amika Coffehouse":
                return "Cafeteria com destaque ao café coado e na prensa francesa, doces e bolos de chocolate, em atmosfera tranquila."
            case "Parque da Liberdade":
                return "Parque pequeno com caminhos e palmeiras ao redor de um lago ornamental, além de gazebos e playground."
            case "Café Arretado":
                return "Café Arretado é uma empresa de comércio de alimentos fundada em 2014, atualmente com duas lojas em Fortaleza sendo, uma no aeroporto internacional, e outra no shopping Benfica."
            case "Shopping Rio Mar Kennedy":
                return "O Shopping RioMar Kennedy oferece comodidade e lazer com uma variedade de lojas, mega lojas, âncoras e uma praça de alimentação diversificada. Conta com opções de entretenimento, como o Planet Park e o cinema Cinépolis com salas 3D e som digital. O shopping possui arquitetura de alto padrão, acessibilidade com elevadores e banheiros adaptados, além de serviços diferenciados como Espaço Família, SAC, Espaço Ecumênico e carregadores portáteis de celular."
            case "Cortile Ristorante":
                return "O Cortile é como uma viagem para fora da cidade, direto para a Itália, aproveitando os maiores prazeres da vida; a conversa, o encontro, a comida."
            case "Cidade da Criança":
                return "A Cidade da Criança em Fortaleza é um espaço recreativo voltado para crianças, oferecendo playgrounds, parques temáticos e atividades educativas. É um destino popular para famílias, promovendo diversão e aprendizado em um ambiente seguro."
            case "Bleecker Café":
               return "A Bleecker Café é uma cafeteria com comida de qualidade. Temos uma ótima localização e somos a melhor opção para quem quer comer bem, beber bem ou trabalhar."
            case "Restaurante Varanda Tropical":
                return "Restaurante informal com pratos da culinária latina de carnes e vegetais grelhados, além de pizzas."
            case "Ecopoint":
                return "Parque ecológico com diversos animais e pássaros, além de instalações para natação e apresentações infantis."
            case "Balcone Restô":
                return "Restaurante italiano moderno com terraço, jardim, pizzas, coquetéis e entradas sofisticadas."
            case "Museu da Cultura Cearense":
                return "O Museu da Cultura Cearense (MCC) é um museu etnográfico que tem como proposta promover a difusão, a fruição e a apropriação do Patrimônio Cultural do Estado do Ceará, mediante ações museológicas de pesquisa, preservação e comunicação, visando a inclusão e desenvolvimento sociocultural."
            case "Lê Bloc Café":
                return "Um café com um toque francês em Fortaleza."
            case "Consulado Café":
                return"O Consulado Café em Fortaleza é um espaço acolhedor que combina café especial e uma variedade de opções de brunch e lanches, além de promover eventos culturais. É um ótimo lugar para relaxar, estudar ou socializar em um ambiente vibrante."
            case "Pinacoteca do Ceará":
                 return "A Pinacoteca do Ceará é um museu integrante da Rede Pública de Equipamentos da Secretaria da Cultura do Estado do Ceará (Secult - CE)"
            case "Shopping Via Sul":
                return "O mix atual conta com 124 lojas, ofertando uma diversidade do mix pra o consumidor, e serviços como Caixa Econômica Federal, Clínica SIM, Salão de Beleza, Lava Jato e Clínica de Depilação e para tornar ainda mais cômodo e prático o dia a dia do cliente. Além disso, o Via Sul é um polo de entretenimento com o Theatro Via Sul, recebendo os melhores espetáculos da cidade, Clubinho do Mar, Espaço Diversão e Centerplex Cinemas."
            case "Praia do Meireles":
                return "A Praia do Meireles, em Fortaleza, é famosa por sua orla vibrante, com quiosques, bares e uma feirinha de artesanato. Ideal para caminhadas e esportes aquáticos, oferece um pôr do sol espetacular e uma atmosfera animada."
            case "Amigos Pizzaria":
                return "O SEU MELHOR AMIGO CHEGOU 🍕🍕"
            case "Bar Chá da Égua":
                return "Boteco colorido e animado onde a moçada entrosada se diverte consumindo comidinhas e pratos muito brasileiros."
            case "Museu da Escrita":
                return "O Museu da Escrita em Fortaleza é um espaço cultural inaugurado em 2018, dedicado à valorização da escrita e da literatura, com exposições interativas e uma coleção de obras literárias. O museu promove atividades educativas e serve como ponto de encontro para escritores e amantes da literatura."
            case "Seu Conrado Cozinha Brasileira":
                return "Pratos brasileiros servidos em um restaurante descontraído com móveis modernos e decoração de plantas."
            case "Mangue Azul":
                return "Alta gastronomia no apoio ao produtor local e à sustentabilidade."
            case "Shopping Benfica":
                return "Shopping dinâmico com várias lojas, restaurantes casuais, eventos e cinema."
            case "Museu de Arte da Universidade Federal do Ceará":
                return "O Museu de Arte da Universidade Federal do Ceará (MAUC), inaugurado em 2008, é um espaço cultural em Fortaleza que promove a arte e a cultura por meio de um acervo diversificado e exposições temporárias. O museu também oferece oficinas e eventos, integrando a comunidade com o ambiente acadêmico."
            case "Centro das Tapioqueiras":
                return "Pratos de tapioca feitos com amido de mandioca em um local descontraído no café da manhã."
            case "Parque Parreão":
                return "O Parque do Cocó, também conhecido como Parque Parejo, é uma área verde em Fortaleza que oferece trilhas, ciclovias e espaços recreativos, além de abrigar rica biodiversidade. É um local popular para atividades ao ar livre e eventos culturais, contribuindo para a qualidade de vida na cidade."

        default:
            return "Descrição não disponível."
        }
    }

    var endereco: String {
           switch lugar.nome {
           case "Parque Adahil Barreto":
               return "Rua Major Virgílio Borba 177 - Dionísio Torres, Fortaleza - CE 60170-120"
           case "Café Cultive":
               return "R. Maria Tomásia 1276 - Aldeota, Fortaleza - CE 60150-170"
           case "Museu da Imagem e Som":
               return "Av. Barão de Studart 410 - Meireles, Fortaleza - CE 60120-000"
           case "Carbono SteakHouse":
               return "Av. Des. Moreira 1300 - Aldeota, Fortaleza - CE 60191-156"
           case "Parque estadual do Cocó":
               return "Av. Padre Antônio Tomás s/n - Cocó, Fortaleza - CE 60060-170"
           case "Mandir Restaurante Vegano":
               return "Rua Padre Francisco Pinto 257 - Benfica Fortaleza - CE 60020-290"
           case "Pizzaria do 10":
               return "Av. João de Araújo Lima 1061 A - Pref. José Walter Fortaleza - CE 60810-670"
           case "Museu do Automóvel":
               return "Av. Chanceler Edson Queiroz 97 - Guararapes Fortaleza - CE 60810-195"
           case "Cervejaria Portuguesa":
               return "Av. Zezé Diogo 5205 - Praia do Futuro Fortaleza - CE 60183-692"
           case "Museu da Fotografia":
               return "R. Frederico Borges 545 - Varjota Fortaleza - CE 60175-040"
           case "Shopping Parangaba":
               return "Rua Germano Franck 300 - Parangaba Fortaleza - CE 60740-020"
           case "Museu do Humor Cearense":
               return "Av. da Universidade 2175 - Benfica Fortaleza - CE 60020-180"
           case "Amika Coffeehouse":
               return "Av. Des. Moreira 2689 - Dionísio Torres Fortaleza - CE 60170-172"
           case "Torra Café":
               return "R. Sabino Pires 17 - Aldeota Fortaleza - CE 60150-090"
           case "Shopping Iguatemi":
               return "Av. Washington Soares 85 - Edson Queiroz Fortaleza - CE 60811-341"
           case "Shopping Riomar Fortaleza":
               return "R. Des. Lauro Nogueira 1500 - Papicu Fortaleza - CE 60175-055"
           case "Praia do Náutico":
               return "Av. Beira Mar, 3301-3399 - Meireles, Fortaleza - CE, 60165-121"
           case "Praia de Iracema":
               return "Av. historiador Eduardo Girão - Fortaleza - CE"
           case "Santa Grelha":
               return "R. Tibúrcio Cavalcante, 790 - Meireles, Fortaleza - CE, 60125-100"
           case "Café Viriato":
               return "R. Osvaldo Cruz, 2828 - Dionísio Torres, Fortaleza - CE, 60125-151"
           case "Parque Bisão":
               return "Av. Beira Mar, 4364 - Mucuripe, Fortaleza - CE, 60165-121"
           case "Museu da Arte Contemporânea":
               return "R. José Avelino, 10 - Centro, Fortaleza - CE, 60060-360"
           case "Giz Cozinha Boêmia":
               return "R. Prof. Dias da Rocha, 579 - Meireles, Fortaleza - CE, 60170-310"
           case "Le Pain Le Café":
               return "R. Prof. Dias da Rocha, 670 - Meireles, Fortaleza - CE, 60170-310"
           case "Complexo Cultural Estação das Artes":
              return "R. Dr. João Moreira, 540 - Centro, Fortaleza - CE, 60030-000"
           case "Praia do Futuro":
              return "Av. D. Manuel, 1000 - Praia do Futuro, Fortaleza - CE, 60182-000"
           case "Amika Coffehouse":
               return "Av. Des. Moreira, 2689 - Dionísio Torres, Fortaleza - CE, 60170-172"
           case "Parque da Liberdade":
               return "R. Pedro I, s/n - Centro, Fortaleza - CE, 60035-100"
           case "Café Arretado":
               return "R. Carapinima, 2200 - Benfica, Fortaleza - CE, 60015-290"
           case "Shopping RioMar Kennedy":
               return "Av. Srg. Hermínio Sampaio, 3100 - Pres. Kennedy, Fortaleza - CE, 60355-512"
           case "Cortile Ristorante":
              return "R. Vicente Leite, 520 - Meireles, Fortaleza - CE, 60170-150"
           case "Cidade da Criança":
              return "Av. Visconde do Rio Branco, 922 - Centro, Fortaleza - CE, 60055-170"
           case "Bleecker Café":
              return "R. Silva Paulet, 1281 - Aldeota, Fortaleza - CE, 60120-021"
           case "Restaurante Varanda Tropical":
              return "Av. Monsenhor Tabosa, 714 - Praia de Iracema, Fortaleza - CE, 60165-010"
           case "Ecopoint":
              return "Av. Senador Fernandes Távora, 387 - Jóquei Clube, Fortaleza - CE, 60510-290"
           case "Balcone Restô":
              return "Av. Senador Fernandes Távora, 387 - Jóquei Clube, Fortaleza - CE, 60510-290"
           case "Museu da Cultura Cearense":
              return "R. Dragão do Mar, 81 - Praia de Iracema, Fortaleza - CE, 60060-195"
           case "Le Bloc Café":
              return "Av. Padre Antônio Tomás, 292 - Loja 1 - Aldeota, Fortaleza - CE, 60140-160"
           case "Consulado Café":
              return "Av. Bezerra de Menezes, 216 - Farias Brito, Fortaleza - CE, 60325-000"
           case "Pinacoteca do Ceará":
              return "R. 24 de Maio, 34 - Centro, Fortaleza - CE, 60020-000"
           case "Shopping Via Sul":
             return "Av. Washington Soares, 4335 - Lagoa Sapiranga (Coité), Fortaleza - CE, 60833-005"
           case "Praia do Meireles":
             return "Av. Beira Mar, 1000 - Meireles, Fortaleza - CE, 60165-001"
           case "Amigos Pizzaria":
             return "R. Vilebaldo Aguiar, 2222 - Cocó, Fortaleza - CE, 60192-025"
           case "Bar Chá da Égua":
             return "Av. dos Expedicionários, 5021 - Vila União, Fortaleza - CE, 60410-545"
           case "Museu da Escrita":
             return "R. Dr. Walter Studart, 56 - Dionísio Torres, Fortaleza - CE, 60125-140"
           case "Seu Conrado Cozinha Brasileira":
             return "R. Conrado Cabral, 711 - Monte Castelo, Fortaleza - CE, 60325-440"
           case "Mangue Azul":
             return "R. Prof. Dias da Rocha, 987 - Aldeota, Fortaleza - CE, 60150-160"
           case "Shopping Benfica":
             return "R. Carapinima, 2200 - Benfica, Fortaleza - CE, 60015-290"
           case "Museu da Arte da Universidade Federal do Ceará":
             return "Av. da Universidade, 2854 - Benfica, Fortaleza - CE, 60020-181"
           case "Centro das Tapioqueiras":
             return "Av. Washington Soares, 10425 - Messejana, Fortaleza - CE, 60843-281"
           case "Parque Parreão":
             return "Av. Eduardo Girão, S/N - Fátima, Fortaleza - CE, 60415-511"

        default:
            return "Endereço não disponível."
        }
    }

    var acessibilidade: String {
        switch lugar.nome {
        case "Parque Adahil Barreto":
            return "Entrada e estacionamento acessível para pessoas com cadeiras de rodas."
        case "Café Cultive":
            return "Assento com acessibilidade, banheiro e entrada acessíveis para pessoas com cadeiras de rodas."
        case "Museu da Imagem e Som":
            return "Banheiro com acessibilidade, dispositivos para auxílio a deficientes auditivos, entrada e estacionamento acessíveis."
        case "Carbono SteakHouse":
            return "Assento, banheiro, entrada e estacionamento acessíveis para pessoas com cadeiras de rodas."
        case "Parque estadual do Cocó":
            return "Entrada e estacionamento acessíveis."
        case "Mandir Restaurante Vegano":
            return "Assento, banheiro, entrada e estacionamento acessíveis para pessoas em cadeira de rodas."
        case "Pizzaria do 10":
            return "Assento e banheiro com acessibilidade para pessoas com cadeiras e rodas."
        case "Museu do Automóvel":
            return "Assento, entrada e estacionamento com acessibilidade para pessoas em cadeira de rodas."
        case "Cervejaria Portuguesa":
            return "Assento, entrada e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Museu da Fotografia":
            return "Banheiro e entrada com acessibilidade para pessoas com cadeira de rodas."
        case "Shopping Parangaba":
            return "Entrada, estacionamento e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Museu do Humor Cearense":
            return "Banheiro e entrada com acessibilidade para pessoas com cadeira de rodas."
        case "Amika Coffeehouse":
            return "Assento e entrada com acessibilidade para pessoas com cadeira de rodas."
        case "Torra Café":
            return "Assento e entrada com acessibilidade para pessoas com cadeira de rodas."
        case "Shopping Iguatemi":
            return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Shopping Riomar Fortaleza":
            return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Praia do Náutico":
            return "Conta com o programa praia acessível para pessoas com cadeira de rodas poderem entrar no mar."
        case "Praia de Iracema":
            return "Conta com o programa praia acessível para pessoas com cadeira de rodas poderem entrar no mar."
        case "Santa Grelha":
            return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Café Viriato":
            return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Parque Bisão":
            return "Entrada e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Museu da Arte Contemporânea":
            return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Giz Cozinha Boêmia":
            return "Entrada, assento e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Le Pain Le Café":
            return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Complexo Cultural Estação das Artes":
           return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Praia do Futuro":
           return "A praia conta com uma infraestutura acessível para pessoas com cadeiras de rodas."
        case "Amika Coffehouse":
            return "Entrada e assento com acessibilidade para pessoas com cadeira de rodas."
        case "Parque da Liberdade":
            return "Entrada e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Café Arretado":
            return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Shopping RioMar Kennedy":
            return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Cortile Ristorante":
           return "Entrada, assento e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Cidade da Criança":
           return "Entrada e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Bleecker Café":
           return "Entrada, assento e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Restaurante Varanda Tropical":
           return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Ecopoint":
           return "Entrada e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Balcone Restô":
           return "Entrada, assento e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Museu da Cultura Cearense":
           return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Le Bloc Café":
           return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Consulado Café":
           return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Pinacoteca do Ceará":
           return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Shopping Via Sul":
          return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Praia do Meireles":
          return "Conta com o programa Praia Acessível para que pessoas que usam cadeiras de rodas possam entrar no mar."
        case "Amigos Pizzaria":
          return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Bar Chá da Égua":
          return "Entrada, assento e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Museu da Escrita":
          return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Seu Conrado Cozinha Brasileira":
          return "Entrada, assento e banheiro com acessibilidade para pessoas com cadeira de rodas."
        case "Mangue Azul":
          return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Shopping Benfica":
          return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Museu da Arte da Universidade Federal do Ceará":
          return "Entrada, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Centro das Tapioqueiras":
          return "Entrada, assento, banheiro e estacionamento com acessibilidade para pessoas com cadeira de rodas."
        case "Parque Parreão":
          return "Entrada com acessibilidade para pessoas com cadeira de rodas."


        default:
            return "Informações de acessibilidade não disponíveis."
        }
    }

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image(lugar.imagem)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(lugar.nome)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack {
                            HStack(spacing: 2) {
                                ForEach(0..<4) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .imageScale(.small)
                                }
                                Image(systemName: "star.leadinghalf.filled")
                                    .foregroundColor(.yellow)
                                    .imageScale(.small)
                            }
                            Text("4,5")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                    }
                    
                    HStack {
                        Button(action: { selectedTab = "Sobre" }) {
                            Text("Sobre")
                                .foregroundColor(selectedTab == "Sobre" ? .white : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedTab == "Sobre" ? Color.green : Color.gray.opacity(0.2))
                                .cornerRadius(20)
                        }
                        
                        Button(action: { selectedTab = "Avaliações" }) {
                            Text("Avaliações")
                                .foregroundColor(selectedTab == "Avaliações" ? .white : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedTab == "Avaliações" ? Color.green : Color.gray.opacity(0.2))
                                .cornerRadius(20)
                        }
                        
                        Button(action: { selectedTab = "Fotos" }) {
                            Text("Fotos")
                                .foregroundColor(selectedTab == "Fotos" ? .white : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedTab == "Fotos" ? Color.green : Color.gray.opacity(0.2))
                                .cornerRadius(20)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        switch selectedTab {
                        case "Sobre":
                            Text("Descrição:")
                                .font(.headline)
                            Text(descricao)
                                .font(.body)
                            
                            Text("Endereço:")
                                .font(.headline)
                            Text(endereco)
                                .font(.body)
                            
                            Text("Acessibilidade:")
                                .font(.headline)
                            Text(acessibilidade)
                                .font(.body)
                            
                        case "Avaliações":
                            if avaliacoes.isEmpty {
                                Text("Nenhuma avaliação disponível.")
                                    .font(.body)
                                    .foregroundColor(.gray)
                            } else {
                                ForEach(avaliacoes) { avaliacao in
                                    AvaliacaoView(avaliacao: avaliacao)
                                        .padding(.bottom, 10)
                                }
                            }
                            
                        case "Fotos":
                            if fotos.isEmpty {
                                Text("Nenhuma foto disponível.")
                                    .font(.body)
                                    .foregroundColor(.gray)
                            } else {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                    ForEach(fotos) { foto in
                                        FotoCardView(foto: foto)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                        default:
                            Text("Selecione uma opção acima.")
                                .font(.body)
                        }
                    }
                }
                .padding()
            }
            
            // Botão Adicionar à rota fixo
            Button(action: {
                           showingSheet.toggle()
                       }) {
                           Text("Adicionar à rota")
                               .font(.headline)
                                      .foregroundColor(.white)
                                      .frame(maxWidth: .infinity)
                                      .padding()
                                      .background(Color.green) // Fundo do botão
                                      .cornerRadius(40)
                       }
                       .padding(.horizontal, 40) // Para espaçar do lado da tela
                       .padding(.bottom) // Para espaçar da parte inferior
                       .background(Color.clear) // Remove qualquer fundo adicional
                       .sheet(isPresented: $showingSheet) {
                           AdicionarLugarSheet(lugarAtual: lugar)
                       }
                   }
                   .navigationBarTitle("Informações", displayMode: .inline)
               }
           }

struct AvaliacaoView: View {
    let avaliacao: Avaliacao
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(avaliacao.imagem)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(avaliacao.nome)
                    .font(.headline)
                
                HStack(spacing: 2) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < avaliacao.rating ? "star.fill" : "star")
                            .foregroundColor(index < avaliacao.rating ? .yellow : .gray)
                            .imageScale(.small)
                    }
                }
                
                Text(avaliacao.comentario)
                    .font(.body)
                    .foregroundColor(Color.black.opacity(0.8))
            }
        }
        .padding(.vertical, 4)
    }
}

struct FotoCardView: View {
    let foto: Foto
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(foto.imagem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(foto.descricao)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(height: 150)
    }
}

struct AdicionarLugarSheet: View {
    
    @Environment(AppState.self) var appState  // Acesso ao estado global do app
    let lugarAtual: Lugar  // O lugar que será adicionado
    @Environment(\.dismiss) var dismiss  // Para fechar o sheet

    // Definindo um layout de grade com 3 colunas
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding(.leading)
                        .padding(.top)
                }
                Spacer()
            }
            
            HStack {
                Image(lugarAtual.imagem)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(lugarAtual.nome)
                        .font(.headline)
                    Text("Praias")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            Text("Adicionar à:")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(appState.rotas) { rota in
                                    VStack {
                                        Button(action: {
                                            // Adicionar o lugar à rota
                                            rota.lugares.append(lugarAtual)
                                            print("Adicionado \(lugarAtual.nome) à \(rota.nome)")
                                            dismiss()  // Fechar o sheet após a adição
                                        }) {
                                            if let imagem = rota.lugares.first?.imagem {
                                                Image(imagem)
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                            } else {
                                                Color.gray
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                                    .opacity(0.4)
                                            }
                                        }
                                        Text(rota.nome)
                                            .font(.subheadline)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                        .presentationDetents([.fraction(0.5)])
                    }
                }
                

                }

            struct DetalhesCardView_Previews: PreviewProvider {
                static var previews: some View {
                    DetalhesCardView(lugar: Lugar(nome: "Praia do Futuro", imagem: "praiadofuturo", tipo: .praia))
                        .environment(AppState())
                }
            }
