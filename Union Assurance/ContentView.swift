//
//  ContentView.swift
//  Union Assurance
//
//  Created by Randimal Geeganage on 2022-11-23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Category()
                .tabItem {
                    Label("Category",systemImage: "list.bullet.rectangle")
                }
            Reward()
                .tabItem {
                    Label("Reward", systemImage: "trophy")
                }
            Leaderboard()
                .tabItem {
                    Label("Leaderboard", systemImage: "chart.bar.xaxis")
                }
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .accentColor(Color.basiccolor)
    }
        
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
