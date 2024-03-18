//
//  LocationMapAnnotionView.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import SwiftUI

struct LocationMapAnnotionView: View {
    let accentColor = Color(.red)
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(100))
                .offset(y:-3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMapAnnotionView()
}
