//
//  LocationPreviewView.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm : LocationViewModel
    let location : Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack(spacing: 8) {
                learnMoreButton
                HStack(spacing: 5) {
                    nextButton
                    prevButton
                }
            }
        }
        .padding(20)
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y:65)
        )
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationDataService.locations.first!)
            .padding()
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    private var titleSection : some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2.bold())
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton : some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn More")
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPassed()
        } label: {
            Text("Next")
                .frame(width: 50, height: 35)
        }
        .buttonStyle(.bordered)
    }
    
    private var prevButton: some View {
        Button {
            vm.nextButtonPassed()
        } label: {
            Text("Prev")
                .frame(width: 50, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
