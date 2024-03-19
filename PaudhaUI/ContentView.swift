//
//  ContentView.swift
//  PaudhaUI
//
//  Created by Anant Narain on 16/01/24.
//

import SwiftUI

struct ContentView: View {
   
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationView {
            TabView(selection: $pageIndex) {
                ForEach(pages) { page in
                    VStack {
                        Spacer()
                        PageView(page: page)
                        Spacer()
                        if page == pages.last {
                            NavigationLink(destination: LoginView()) {
                                Text("Login!")
                            }
                            .buttonStyle(.bordered)
                        } else {
                            Button("next", action: incrementPage)
                                .buttonStyle(.borderedProminent)
                        }
                        Spacer()
                    }
                    .tag(page.tag)
                }
            }
        
            .animation(.easeInOut, value: pageIndex)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func incrementPage() {
        pageIndex += 1
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
