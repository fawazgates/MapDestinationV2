//
//  LocationViewModel.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import SwiftUI
import MapKit

class LocationViewModel : ObservableObject {
    //MARK: - PROPERTIES
    
    //MARK: - ALL LOADED LOCATION
    
    @Published var locations: [Location]
    
    //MARK: - CURRENT LOCATION ON MAP
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //MARK: - SHOW LIST OF LOCATIONS
    
    @Published var showLocationList : Bool = false
    
    //MARK: - SHOW LOCATION DETAILS VIA SHEET
    
    @Published var sheetLocation : Location? = nil
    
    //MARK: - Initialization
    
    init() {
        let locations = LocationDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location:locations.first!)
    }
    
    //MARK: - PRIVATE METHODS
    
    private func updateMapRegion(location:Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion (
                center: mapLocation.coordinate, span: mapSpan
            )
        }
    }
    //MARK: - ACTION
    
    func toggleLocationsList(){
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPassed() {
        //get current index
        
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Clound not find current index in location array!")
            return
        }
        
        // check if the next index is filed
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            //next index is not valid
            //restart from zero
            
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        //next index valid
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    func prevButtonPressed() {
        //get current index
        
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Clound not find current index in location array!")
            return
        }
        
        //check if the prev index is valid
        
        let prevIndex = currentIndex - 1
        guard locations.indices.contains(prevIndex) else {
            //next index is valid
            //restart from last
            
            guard let lastLocation = locations.last else { return }
            showNextLocation(location: lastLocation)
            return
        }
        //prev index is valid
        let prevLocation = locations[prevIndex]
        showNextLocation(location: prevLocation)
    }
}
