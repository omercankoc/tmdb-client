//
//  ContentView.swift
//  tmdbclient
//
//  Created by Ömer Can Koç on 27.05.2022.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    MoviesCardView(title: "Now Playing", path: "/movie/now_playing", orientation: "vertical")
                    MoviesCardView(title: "Upcoming", path: "/movie/upcoming",orientation: "horizontal")
                    MoviesCardView(title: "Popular", path: "/movie/popular",orientation: "horizontal")
                }
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            })
            .background(Color("background"))
            .navigationBarHidden(true)
            .ignoresSafeArea(.all,edges:.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
