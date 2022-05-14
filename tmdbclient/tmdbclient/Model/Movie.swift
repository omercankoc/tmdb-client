import Foundation

struct MovieResponse : Decodable {
    let result : [Movie]
}

struct Movie : Decodable {
    let id : Int
    let tittle : String
    let backdropPath : String?
    let posterPath : String?
    let overview : String
    let voteAverage : Double
    let voteCount : Int
    let runtime : Int?
}
