import UIKit

final class TableViewCell: UITableViewCell {
    static var reuseID : String = "table"
    
    private lazy var icon : UIImageView = AppUIFuncs.createImageView(withSize: CGRect(x: 11, y: 11, width: 23, height: 23))
    
    private lazy var viewForIcon : UIView = AppUIFuncs.createView(
        withSize: CGRect(x: 15, y: 13, width: 46, height: 46),
        cornerRadius: 23,
        backgroundColor: .appLightGray)
    
    private lazy var label : UILabel = AppUIFuncs.createLabel(
        withSize: CGRect(x: viewForIcon.frame.maxX + 11, y: 3, width: frame.width - 104, height: frame.height - 30),
        textAlignment: .left, textColor: .black, font: UIFont.getUbuntuFont(fontType: .regular))
    
    private lazy var cellView : UIView = AppUIFuncs.createView(
        withSize: CGRect(x: 0, y: 20, width: frame.width, height: 72),
        cornerRadius: 20,
        backgroundColor: .white)
    
    func setUpCell(with item: TableItem) {
        backgroundColor = .black
        selectionStyle = .none
        
        icon.image = UIImage(named: item.image)
        viewForIcon.addSubview(icon)
        
        label.text = item.text
        [viewForIcon, label].forEach { cellView.addSubview($0) }
        
        addSubview(cellView)
    }
}
