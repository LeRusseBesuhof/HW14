import UIKit

final class TableViewCell: UITableViewCell {
    static var reuseID : String = "table"
    
    private lazy var icon : UIImageView = AppUIFuncs.createImageView(withSize: CGRect(x: 15, y: 13, width: 46, height: 46))
    
    private lazy var label : UILabel = AppUIFuncs.createLabel(
        withSize: CGRect(x: icon.frame.maxX + 11, y: 15, width: frame.width - 104, height: frame.height - 30),
        textAlignment: .left, textColor: .black, font: UIFont.getUbuntuFont(fontType: .regular))
    
    func setUpCell(with item: TableItem) {
        layer.cornerRadius = 20
        backgroundColor = .white
        selectionStyle = .none
        
        let rawImage = UIImage(named: item.image)
        let scaledImage = rawImage!.scalePreservingAspectRatio(targetSize: 23)
        icon.image = scaledImage

        label.text = item.text
        
        [icon, label].forEach { addSubview($0) }
    }
}
