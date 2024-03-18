//
//  LocationDataService.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import Foundation
import MapKit

class LocationDataService {
    
    static let locations : [Location] = [
        Location (
            name: "MONAS",
            cityName: "Jakarta",
            coordinate: CLLocationCoordinate2D(latitude: -6.1753924, longitude: 106.8245779),
            description: "Monumen Nasional (Monas) adalah salah satu landmark atau arsitektur terkenal di Jakarta, Indonesia. Monas tidak hanya menjadi simbol kota Jakarta, tetapi juga menjadi simbol perjuangan dan kemerdekaan bangsa Indonesia.",
            imageNames: ["monas"],
            link: "https://id.wikipedia.org/wiki/Monumen_Nasional")
    ]
}
