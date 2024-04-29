//
//  ImageLoader.swift
//  NSCacheDemo
//
//  Created by Thongchai Subsaidee on 30/4/24.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    private let cache = NSCache<NSString, UIImage>()
    
    init() {
        cache.countLimit = 10
        cache.totalCostLimit = 100
    }
    
    func getImageFromCache(url: String) -> UIImage? {
        cache.object(forKey: url as NSString)
    }
    
    func storeImageInCache(image: UIImage, url: String) {
        cache.setObject(image, forKey: url as NSString)
    }
    
    @MainActor
    func fetchImage(_ url: String) async throws {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
//        let request = URLRequest(url: url)
        
        //lets check if the image is in the cache it is lets get it from here
        if let cacheImage = getImageFromCache(url: url.absoluteString) {
            self.image = cacheImage
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        if let uiImage = UIImage(data: data) {
            //if kepp to cache
            storeImageInCache(image: uiImage, url: url.absoluteString)
            
            self.image = uiImage
        }
    }
}
