//
//  ContentView.swift
//  MapKit-SwiftUI
//
//  Created by Tom Baranes on 08/02/2020.
//  Copyright © 2020 tbaranes. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var landmarks = [Landmark(annotationType: .pin, name: "Sydney Harbour Bridge", location: CLLocationCoordinate2D(latitude: -33.852222, longitude: 151.210556)),
                                    Landmark(annotationType: .nativePin, name: "Sydney Opera House", location: CLLocationCoordinate2D(latitude: -33.858611, longitude: 151.214167))]
    @State private var selectedLandmark: LandmarkAnnotation? = nil
    @State private var showingPlaceDetails = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                MapView(landmarks: $landmarks,
                        selectedLandmark: $selectedLandmark,
                        showingPlaceDetails: $showingPlaceDetails,
                        defaultCoordinates: CLLocationCoordinate2D(latitude: -33.852222, longitude: 151.210556),
                        showUserLocation: true)
                    .edgesIgnoringSafeArea(.all)

                if selectedLandmark != nil {
                    NavigationLink(destination: LandmarkDetails(landmark: selectedLandmark!), isActive: self.$showingPlaceDetails) {
                        EmptyView()
                    }
                }
            }.navigationBarTitle("").navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
