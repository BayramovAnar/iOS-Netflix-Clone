//
//  Movie.swift
//  Netflix
//
//  Created by Anar Bayramov on 3/21/22.
//

import Foundation

struct TrendingTitleResponse: Codable{
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let vote_average: Double
    let vote_count: Int
    let media_type: String?
}



