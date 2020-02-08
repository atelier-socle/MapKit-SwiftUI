//
//  PinMKAnnotationView.swift
//  SheetSlideCard
//
//  Created by Tom Baranes on 04/02/2020.
//  Copyright © 2020 Wlad Dicario. All rights reserved.
//

import MapKit

final class PinMKAnnotationView: MKAnnotationView {

    private var imageView: UIImageView!

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        canShowCallout = true
        frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        imageView = UIImageView(image: UIImage(named: "Pin"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = self.bounds
        addSubview(self.imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
