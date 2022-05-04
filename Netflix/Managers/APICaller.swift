//
//  APICaller.swift
//  Netflix
//
//  Created by Anar Bayramov on 3/21/22.
//

import Foundation

struct Constants{
    static let API_KEY = "8afd8ac7db2237a9f37d3c304bcf9d64"
    static let baseURL = "https://api.themoviedb.org/"
    static let YouTubeAPI_KEY = "AIzaSyDtmn8JyufxXtbXgcHO9c7x6Q-L3cY6c8c"
    static let YouTubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error{
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        
        task.resume()
    }
    
    
    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=8afd8ac7db2237a9f37d3c304bcf9d64") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=8afd8ac7db2237a9f37d3c304bcf9d64&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=8afd8ac7db2237a9f37d3c304bcf9d64&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        
        task.resume()
    }
    
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=8afd8ac7db2237a9f37d3c304bcf9d64&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        
        task.resume()
    }
    
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=8afd8ac7db2237a9f37d3c304bcf9d64&query=\(query)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        
        task.resume()
}

    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.YouTubeBaseURL)q=\(query)&key=\(Constants.YouTubeAPI_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _ , error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            }catch{
                completion(.failure(error))
            }
            
        }
        
        task.resume()
}

}