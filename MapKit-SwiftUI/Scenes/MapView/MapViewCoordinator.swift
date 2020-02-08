//
//  MapViewCoordinator.swift
//  SheetSlideCard
//
//  Created by Tom Baranes on 04/02/2020.
//  Copyright © 2020 Wlad Dicario. All rights reserved.
//

import MapKit

final class MapViewCoordinator: NSObject {

    // MARK: Properties

    private var parent: MapView

    // MARK: Life Cycle

    init(parent: MapView) {
        self.parent = parent
    }

}

// MARK: - CLLocationManagerDelegate

extension MapViewCoordinator: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Uncomment this if you want the map update itself when the user is moving
//        guard let locValue = manager.location?.coordinate, parent.showUserLocation else {
//            return
//        }
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//        let region = MKCoordinateRegion(center: locValue, span: span)
//        parent.mapView.setRegion(region, animated: true)
    }

}

// MARK: - MKMapViewDelegate

extension MapViewCoordinator: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotationType = (annotation as? LandmarkAnnotation)?.annotationType else {
            return nil
        }

        let identifier = annotationType.rawValue
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = makeAnnotation(annotation, annotationType: annotationType, reuseIdentifier: identifier)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }

    private func makeAnnotation(_ annotation: MKAnnotation, annotationType: AnnotationType, reuseIdentifier: String) -> MKAnnotationView {
        let annotationView: MKAnnotationView
        switch annotationType {
        case .pin:
            annotationView = PinMKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        case .nativePin:
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        }
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let placemark = view.annotation as? LandmarkAnnotation else {
            return
        }

        parent.selectedLandmark = placemark
        parent.showingPlaceDetails = true
    }

}
