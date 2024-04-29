//
//  URLImageView.swift
//  NSCacheDemo
//
//  Created by Thongchai Subsaidee on 30/4/24.
//

import SwiftUI

struct URLImageView:View {
    
    @StateObject private var imageLoader = ImageLoader()
    var url: String
    
    var body: some View {
        VStack {
            if let image = imageLoader.image{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
        }
        .task {
            do{
                try await imageLoader.fetchImage(url)
            }catch{
                print(error.localizedDescription)
            }
        }
    }

}

#Preview {
    URLImageView(url: "https://via.placeholder.com/600/8e973b")
}
