import SwiftUI
import MapKit

struct MapaRotaView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -3.7327, longitude: -38.5270),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapaRotaView_Previews: PreviewProvider {
    static var previews: some View {
        MapaRotaView()
    }
}

