//
//  YoutubeSearchResponse.swift
//  Netflix
//
//  Created by Anar Bayramov on 3/24/22.
//

import Foundation

struct YoutubeSearchResponse: Codable{
    let items: [VideoElement]
    
}

struct VideoElement: Codable{
    let id: IdVideoElement
}

struct IdVideoElement: Codable{
    let kind: String
    let videoId: String
}






