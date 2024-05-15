import Foundation
import UIKit

enum UbuntuType : String {
    case regular = "Ubuntu-Regular"
    case medium = "Ubuntu-Medium"
    case bold = "Ubuntu-Bold"
}

extension UIFont {
    static func getUbuntuFont(fontType: UbuntuType = .regular, size: CGFloat = 16) -> UIFont {
        .init(name: fontType.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
