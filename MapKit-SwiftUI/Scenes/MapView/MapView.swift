//
//  MapView.swift
//  SheetSlideCard
//
//  Created by Wlad Dicario on 28/01/2020.
//  Copyright © 2020 Wlad Dicario. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    @Binding var landmarks: [Landmark]
    @Binding var selectedLandmark: LandmarkAnnotation?
    @Binding var showingPlaceDetails: Bool

    let defaultCoordinates: CLLocationCoordinate2D
    let showUserLocation: Bool
    let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)

    private let locationManager = CLLocationManager()
    let mapView = MKMapView()

    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        if showUserLocation {
            enableUserLocation(context: context)
        }
        return mapView
    }

    private func enableUserLocation(context: Context) {
        mapView.showsUserLocation = true

        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = context.coordinator
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        if let coor = mapView.userLocation.location?.coordinate {
            mapView.setCenter(coor, animated: true)
        }
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if !showUserLocation {
            let region = MKCoordinateRegion(center: defaultCoordinates, span: defaultSpan)
            view.setRegion(region, animated: true)
        }

        view.removeAnnotations(view.annotations)
        let newAnnotations = landmarks.map { LandmarkAnnotation(landmark: $0) }
        view.addAnnotations(newAnnotations)
    }

    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(parent: self)
    }

}
