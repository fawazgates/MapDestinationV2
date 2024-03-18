//
//  MapDestinationV2App.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import SwiftUI
import SwiftData

@main

struct MapDestinationV2App: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
