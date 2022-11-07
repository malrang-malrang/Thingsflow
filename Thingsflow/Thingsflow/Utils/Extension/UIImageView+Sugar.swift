//
//  UIImageView+Sugar.swift
//  Thingsflow
//
//  Created by 김동욱 on 2022/11/07.
//

import UIKit

extension UIImageView {
    private var imageDownloadTask: URLSessionDataTask? {
        get { objc_getAssociatedObject(self, "image") as? URLSessionDataTask }
        set { objc_setAssociatedObject(self, "image", newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    func setImage(with urlstring: String, placeholder: UIImage? = nil) {
        self.imageDownloadTask?.suspend()
        self.imageDownloadTask?.cancel()

        let cacheManager = ImageCacheManager.shared

        if let cacheImage = cacheManager.getImage(key: urlstring) {
            return self.loadOnMainScheduler(image: cacheImage)
        }

        self.imageDownloadTask = ImageDownloader.share.download(with: urlstring) { result in
            switch result {
            case .success(let image):
                cacheManager.saveImage(key: urlstring, image: image)
                self.loadOnMainScheduler(image: image)
                return
            case .failure:
                guard let placeholder = placeholder else { return }
                self.loadOnMainScheduler(image: placeholder)
                return
            }
        }
    }

    private func loadOnMainScheduler(image: UIImage) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
