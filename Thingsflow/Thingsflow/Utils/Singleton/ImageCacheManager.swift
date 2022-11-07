//
//  ImageCacheManager.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import UIKit

final class ImageCacheManager {
    static let shared = ImageCacheManager()

    private let cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        return cache
    }()

    private init() {}

    func getImage(key: String) -> UIImage? {
        return self.cache.object(forKey: key as NSString)
    }

    func saveImage(key: String, image: UIImage) {
        self.cache.setObject(image, forKey: key as NSString)
    }
}
