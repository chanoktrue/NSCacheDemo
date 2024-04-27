//
//  Photo.swift
//  NSCacheDemo
//
//  Created by Thongchai Subsaidee on 27/4/24.
//

import Foundation


struct Photo: Identifiable, Codable {
    var id: Int
    let title: String
    let thumbnailUrl: String
}
