//
//  SideMenuView.swift
//  PaudhaUI
//
//  Created by user1 on 19/02/24.
//

import SwiftUI
import UIKit

struct SideMenuView: View {
    @Binding var isSideMenuPresented: Bool

    var body: some View {
        List {
            Section(header: Text("Menu")) {
                NavigationLink(destination: SettingsView()) {
                    Label("Settings", systemImage: "gear")
                }

                NavigationLink(destination: FeedbackView()) {
                    Label("Give Feedback", systemImage: "message")
                }

                NavigationLink(destination: ContactAndSocialView()) {
                    Label("Contact & Social", systemImage: "person")
                }

                // Add more sections as needed
            }
        }
        .background( LinearGradient(gradient: Gradient(colors: [Color(red: 0.9686, green: 0.8824, blue: 0.8431), Color(red: 240/255.0, green: 255/255.0, blue: 241/255.0)]),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing
                                 ))
        .listStyle(SidebarListStyle())
        .onAppear {
            isSideMenuPresented = true
        }
        
    }
}
