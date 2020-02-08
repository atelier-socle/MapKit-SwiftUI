//
//  LandmarkDetails.swift
//  SheetSlideCard
//
//  Created by Tom Baranes on 05/02/2020.
//  Copyright © 2020 Wlad Dicario. All rights reserved.
//

import SwiftUI

struct LandmarkDetails: View {
    let landmark: LandmarkAnnotation

    var body: some View {
        Text("Hello \(landmark.title ?? "")")
            .navigationBarTitle("Landmark Details", displayMode: .inline)
    }
}
