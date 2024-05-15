import Foundation
import UIKit

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGFloat) -> UIImage {
        
        let ratio = targetSize / size.width
        
        let scaledImageSize = CGSize(width: size.width * ratio, height: size.height * ratio)

        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: scaledImageSize))
        }
        
        return scaledImage
    }
}
