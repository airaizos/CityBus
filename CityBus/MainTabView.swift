//
//  MainTabView.swift
//  CityBus
//
//  Created by Adrian Iraizos Mendoza on 8/10/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SearchBusStopView()
                .tabItem {
                    Image(systemName: "house")
                    
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    
                }
            BusLinesView()
                .tabItem {
                    Image(systemName: "clock")
                    
                }
            ProgressView()
                .tabItem {
                    Image(systemName: "mappin")
                    
                }
            ProgressView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    
                }
                .tableStyle(.automatic)
        }
    }
}

#Preview {
    MainTabView()
}
