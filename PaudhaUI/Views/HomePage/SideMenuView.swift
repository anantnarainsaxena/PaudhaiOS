//
//  SideMenuView.swift
//  PaudhaUI


import SwiftUI
import FirebaseAuth

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
                
                Button(action: logout) {
                    Label("Logout", systemImage: "power")
                }
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
    
    func logout() {
        do {
            try Auth.auth().signOut()
            
            // Set the root view controller to the login view controller
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: LoginView())
            }
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
}

