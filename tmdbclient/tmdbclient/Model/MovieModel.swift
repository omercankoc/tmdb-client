//
//  MovieModel.swift
//  tmdbclient
//
//  Created by Ömer Can Koç on 27.05.2022.
//

import Foundation

struct MovieModel : Identifiable, Decodable {
    
    var backdrop_path : String?
    var id : Int?
    var genres : [GenreModel]?
    var overview : String?
    var poster_path : String?
    var release_date : String?
    var runtime : String?
    var title : String?
}
