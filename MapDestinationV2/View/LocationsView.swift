//
//  LocationsView.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    //MARK: - Properties
    @EnvironmentObject private var vm : LocationViewModel
    let maxWidthForIpad : CGFloat = 700
    
    //MARK: - body
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                
                Spacer()
                
                locationPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation) {
            location in
            LocationDetailView(location: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationsView {
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                LocationMapAnnotionView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
    }
    
    private var header: some View {
        Group {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(.degrees(vm.showLocationList ? 180 : 0))
                    }
            }
            if vm.showLocationList {
                 LocationListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.3), radius: 30, x: 0, y: 70)
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) {
                location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
