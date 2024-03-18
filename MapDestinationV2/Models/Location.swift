//
//  Location.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import Foundation
import MapKit

struct  Location: Identifiable, Equatable {
    //MARK: - PROPERTIES
    
    let name: String
    let cityName: String
    let coordinate: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    //MARK: - Identifable
    
    var id: String {
        // Generate a unique ID by combining name and city name
        name + cityName
    }
    
    //MARK: - Equeatable
    
    static func == (lhs : Location,rhs : Location) -> Bool {
        //compare locations by their unique IDs
        lhs.id == rhs.id
    }
}
