//
//  NetworkService.swift
//  NSCacheDemo
//
//  Created by Thongchai Subsaidee on 27/4/24.
//

import Foundation

enum APIError: Error {
    case invalidUrl
}

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchPhotos() async throws -> [Photo] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/2/photos") else {
            throw APIError.invalidUrl
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let photos = try JSONDecoder().decode([Photo].self, from: data)
            return photos
        }catch {
            throw APIError.invalidUrl
        }
    }
    
}
