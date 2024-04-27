//
//  PhotoViewModel.swift
//  NSCacheDemo
//
//  Created by Thongchai Subsaidee on 27/4/24.
//

import Foundation



class PhotoViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    
    init() {
        getPhotos()
    }
    
    func getPhotos() {
        Task { @MainActor in
            self.photos = try await NetworkService.shared.fetchPhotos()
        }
    }
    
}
