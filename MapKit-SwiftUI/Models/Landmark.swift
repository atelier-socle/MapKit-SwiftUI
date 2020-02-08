//
//  Landmark.swift
//  SheetSlideCard
//
//  Created by Tom Baranes on 04/02/2020.
//  Copyright © 2020 Wlad Dicario. All rights reserved.
//

import Foundation
import MapKit

struct Landmark: Identifiable {
    let id = UUID().uuidString
    let annotationType: AnnotationType
    let name: String
    let location: CLLocationCoordinate2D
}

