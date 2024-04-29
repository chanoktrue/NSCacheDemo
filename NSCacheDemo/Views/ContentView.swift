//
//  ContentView.swift
//  NSCacheDemo
//
//  Created by Thongchai Subsaidee on 27/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var photoVM = PhotoViewModel()
    
    var body: some View {
        Text("test")
        List(photoVM.photos) { photo in
            HStack{
//                AsyncImage(url: URL(string: photo.thumbnailUrl))
                URLImageView(url: photo.thumbnailUrl)
                Text(photo.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
