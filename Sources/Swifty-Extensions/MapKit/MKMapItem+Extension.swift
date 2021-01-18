//
//  MKMapItem+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 13/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import MapKit

public extension MKMapItem {
    
    convenience init(coordinate: CLLocationCoordinate2D, name: String) {
        self.init(placemark: .init(coordinate: coordinate))
        self.name = name
    }
    
}
