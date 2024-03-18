//
//  LocationListView.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var vm : LocationViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location:location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationViewModel())
}

extension LocationListView {
    private func listRowView(location : Location)-> some View {
        HStack {
            if let imageNames = location.imageNames.first {
                Image(imageNames)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
