//
//  MoviesSliderView.swift
//  tmdbclient
//
//  Created by Ömer Can Koç on 2.06.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesSliderView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MoviesSliderViewItem : View {
    var item : MovieModel
    var index : Int
    
    var body: some View {
        NavigationLink(destination : MovieDetailView(),
        label: {
            ZStack(alignment: .bottomLeading) {
                WebImage(url: URL(string: "\(APIViewModel.imageURL)\(item.backdrop_path ?? "")"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    .tag(index)
                VStack(alignment: .leading){
                    Text(item.title ?? "Loading...")
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .redacted(reason: item.title == nil ? .placeholder : .init())
                        .padding(.leading)
                    Text(item.release_date ?? "Loading...")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .redacted(reason: item.release_date == nil ? .placeholder : .init())
                        .padding(.leading)
                }
                .padding()
            }
        })
    }
}

struct MoviesSliderView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSliderView()
    }
}
