//
//  MoviesCardView.swift
//  tmdbclient
//
//  Created by Ömer Can Koç on 29.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesCardView: View {
    @ObservedObject private var viewModel = MoviesViewModel()
    
    var title : String
    var sortBy : String
    
    var orientation : String = "horizontal"
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                
            }
            .padding()
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing : 15){
                    ForEach(viewModel.items ?? viewModel.placeholders, id: \.id) { item in
                        NavigationLink(
                            destination: MovieDetailView(),
                            label: {
                                MovieCardViewItem(item: item, orientation: orientation)
                            }
                        )
                    }
                }
                .padding()
            }
            Spacer()
        }
        .onAppear {
            viewModel.getMovies(sortBy: sortBy)
        }
    }
}

struct MovieCardViewItem : View {
    var item : MovieModel
    var orientation : String = "horizontal"
    
    var body : some View {
        VStack {
            WebImage(url: URL(string: "\(APIViewModel.imageURL)\((orientation == "horizontal" ? item.backdrop_path : item.poster_path) ?? "")"))
                .resizable()
                .scaledToFit()
                .frame(width: orientation == "horizontal" ? 200 : 160, height: orientation == "horizontal" ? 120 : 240)
                .redacted(reason: item.poster_path == nil ? .placeholder : .init())
                .cornerRadius(8)
            HStack {
                VStack(alignment: .leading, spacing: 0){
                    Text(item.title ?? "Loading...")
                        .font(.system(size: orientation == "horizontal" ? 17 : 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .redacted(reason: item.title == nil ? .placeholder : .init())
                    Text(item.overview ?? "Loading...")
                        .font(.system(size: orientation == "horizontal" ? 15 : 13))
                        .lineLimit(2)
                        .foregroundColor(.gray)
                        .redacted(reason: item.overview == nil ? .placeholder : .init())
                }
                Spacer()
            }
        }
        .frame(width: orientation == "horizontal" ? 200 : 160)
    }
}

struct MoviesCardView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesCardView(title : "TITLE", sortBy : "popularity.asc")
    }
}
