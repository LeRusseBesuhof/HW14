import Foundation
import UIKit

final class AppUIFuncs {
    
    static func createLabel(withSize size: CGRect, text: String? = "", textAlignment: NSTextAlignment, textColor: UIColor, font: UIFont, numberOfLines: Int = 2) -> UILabel {
        
        {
            $0.text = text
            $0.textAlignment = textAlignment
            $0.textColor = textColor
            $0.font = font
            $0.numberOfLines = 0
            return $0
        }(UILabel(frame: size))
    }
    
    static func createImageView(withSize size: CGRect) -> UIImageView {
        {
            $0.backgroundColor = .appLightGray
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 23
            $0.contentMode = .center
            return $0
        }(UIImageView(frame: size))
    }
}
