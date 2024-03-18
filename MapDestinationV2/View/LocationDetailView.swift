//
//  LocationDetailView.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm : LocationViewModel
    let location : Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    
                    Divider()
                    
                    descriptionSection
                    
                    Divider()
                    
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backbutton
        }
    }
}

#Preview {
    LocationDetailView(location: LocationDataService.locations.first!)
        .environmentObject(LocationViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width
                    )
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
    }
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    private var descriptionSection : some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(location.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                if let url = URL(string: location.link) {
                    Link("Read more on wikipedia", destination: url)
                        .font(.headline)
                        .tint(.blue)
                }
            }
        }
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                LocationMapAnnotionView()
                    .shadow(radius: 18)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    private var backbutton : some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
