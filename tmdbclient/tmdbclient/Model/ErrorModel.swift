//
//  ErrorModel.swift
//  tmdbclient
//
//  Created by Ömer Can Koç on 29.05.2022.
//

import Foundation

struct ErrorModel : Decodable {
    var status_message : String?
    var statuc_code : String?
}
