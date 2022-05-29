//
//  DiscoverResponseModel.swift
//  tmdbclient
//
//  Created by Ömer Can Koç on 29.05.2022.
//

import Foundation

struct DiscoverModel : Decodable {
    var page : Int?
    var results : [MovieModel]?
    var totalResults : Int?
    var totalPages : Int?
}
