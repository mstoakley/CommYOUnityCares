//
//  CommunityMapView.swift
//  commYOUnityCares
//
//  Created by Javon Carlyle Thomas on 3/29/24.
//
import SwiftUI
import MapKit

struct CommunityMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 30.0954, longitude: -95.9875),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var selectedPlace: Place?
    @State private var searchText = "" // For the search bar
    @State private var showingAddPlaceForm = false
    @State private var places: [Place] = [
        Place(name: "Prairie View A&M University", coordinate: CLLocationCoordinate2D(latitude: 30.0954, longitude: -95.9875)),
        Place(name: "Hempstead Recreational Center", coordinate: CLLocationCoordinate2D(latitude: 30.0928, longitude: -96.0611)),
        Place(name: "Waller County Community Center", coordinate: CLLocationCoordinate2D(latitude: 30.0883, longitude: -95.9932)),
        Place(name: "Waller Civic Center", coordinate: CLLocationCoordinate2D(latitude: 30.0200, longitude: -95.9317)),
        Place(name: "Fields Store Community Center", coordinate: CLLocationCoordinate2D(latitude: 30.1660, longitude: -95.9242)),
        // Add more community centers as needed
    ]
    
    var cameraPosition: MapCameraPosition {
        MapCameraPosition.region(region)
    }
    
    var filteredPlaces: [Place] {
        if searchText.isEmpty {
            return places
        } else {
            return places.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Map(position: .constant(cameraPosition)) {
                    ForEach(filteredPlaces) { place in
                        Marker(place.name, coordinate: place.coordinate)
                    }
                }
                .edgesIgnoringSafeArea(.top)
                
                TextField("Search...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List {
                    ForEach(filteredPlaces) { place in
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
            }
            .navigationBarTitle("Community Finder", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                showingAddPlaceForm = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddPlaceForm) {
                AddPlaceForm()
            }
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

struct AddPlaceForm: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var address: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Address", text: $address)
                Button("Add") {
                    // Here, you'd typically geocode the address and add the place, but we'll skip this step
                    dismiss()
                }
                .disabled(name.isEmpty || address.isEmpty)
            }
            .navigationBarTitle("Add New Place", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") { dismiss() })
        }
    }
}

struct Place: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}

#Preview {
    CommunityMapView()
}
