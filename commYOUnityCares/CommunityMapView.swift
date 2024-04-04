//
//  CommunityMapView.swift
//  commYOUnityCares
//
//  Created by Javon Carlyle Thomas on 3/29/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct CommunityMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 30.0954, longitude: -95.9875),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var selectedPlace: Place?
    
    var cameraPosition: MapCameraPosition {
        MapCameraPosition.region(region)
    }
    
    let places: [Place] = [
        Place(name: "Prairie View A&M University", coordinate: CLLocationCoordinate2D(latitude: 30.0954, longitude: -95.9875)),
        Place(name: "Hempstead Recreational Center", coordinate: CLLocationCoordinate2D(latitude: 30.0928, longitude: -96.0611)),
        Place(name: "Waller County Community Center", coordinate: CLLocationCoordinate2D(latitude: 30.0883, longitude: -95.9932)),
        Place(name: "Waller Civic Center", coordinate: CLLocationCoordinate2D(latitude: 30.0200, longitude: -95.9317)),
        Place(name: "Fields Store Community Center", coordinate: CLLocationCoordinate2D(latitude: 30.1660, longitude: -95.9242)),
        // Add more community centers as needed
    ]
    
    var body: some View {
        Spacer()
        VStack {
            Map(position: .constant(cameraPosition)) {
                ForEach(places) { place in
                    Marker(place.name, coordinate: place.coordinate)
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            List {
                ForEach(places) { place in
                    Text(place.name)
                        .padding()
                        .background(selectedPlace == place ? Color.blue.opacity(0.5) : Color.clear)
                        .cornerRadius(8)
                        .onTapGesture {
                            selectedPlace = place
                            moveToSelectedPlace()
                        }
                }
            }
            Spacer()
        }
    }
    
    private func moveToSelectedPlace() {
        if let selectedPlace = selectedPlace {
            withAnimation {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: selectedPlace.coordinate.latitude, longitude: selectedPlace.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            }
        }
    }
}

struct Place: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
    }}

#Preview {
    CommunityMapView()
}
