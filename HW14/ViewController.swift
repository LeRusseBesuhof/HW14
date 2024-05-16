import UIKit

final class ViewController: UIViewController {

    private lazy var elementWidth = view.frame.width - 60
    
    private lazy var backButton : UIBarButtonItem = {
        $0.tintColor = .white
        return $0
    }(UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(goBackwards(sender: ))))
    
    private lazy var titleLabel : UILabel = AppUIFuncs.createLabel(
        withSize: CGRect(x: .zero, y: .zero, width: 50, height: .zero),
        text: "О нас", textAlignment: .center, textColor: .white, font: UIFont.getUbuntuFont(fontType: .bold, size: 30))
    
    private lazy var descrLabel : UILabel = AppUIFuncs.createLabel(
        withSize: CGRect(x: 30, y: navigationItem.titleView!.frame.maxY + 33, width: elementWidth, height: 46),
        text: "Мы бродячие артисты\nМы в дороге день за днём.\nИ фургончик в поле чистом,\nЭто наш привычный дом.",
        textAlignment: .center, textColor: .white, font: UIFont.getUbuntuFont(fontType: .medium, size: 20))
    
    private let tableData : [TableItem] = TableItem.getMockStackData()
    
    private lazy var tableView : UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseID)
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        return $0
    }(UITableView(frame: CGRect(x: 30, y: descrLabel.frame.maxY + 45, width: elementWidth, height: 368)))
    
    private lazy var nextLabel : UILabel = AppUIFuncs.createLabel(
        withSize: CGRect(x: 30, y: 22, width: 155, height: 16),
        text: "Веселые ребята",
        textAlignment: .left,
        textColor: .lightGray,
        font: UIFont.getUbuntuFont(fontType: .regular, size: 14),
        numberOfLines: 1)
    
    private lazy var config : UIButton.Configuration = { return $0 }(UIButton.Configuration.plain())
    
    private lazy var button : UIButton = {
        $0.setTitle("Далее", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .black
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.frame = CGRect(x: nextLabel.frame.maxX, y: 0, width: 150, height: 60)
        $0.addTarget(self, action: #selector(pressButton(sender: )), for: .touchUpInside)
        
        $0.configuration?.imagePlacement = .trailing
        $0.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)
        $0.configuration?.imagePadding = 11
        $0.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.getUbuntuFont(fontType: .bold, size: 20)
            return outgoing
        }
        
        return $0
    }(UIButton(configuration: config))
    
    private lazy var nextView : UIView = { nV in
        nV.backgroundColor = .appWhite
        nV.layer.cornerRadius = 20
        [nextLabel, button].forEach { nV.addSubview($0) }
        return nV
    }(UIView(frame: CGRect(x: 30, y: view.frame.height - 126, width: elementWidth, height: 60)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.titleView = titleLabel
        navigationItem.titleView?.sizeToFit()

        [descrLabel, tableView, nextView].forEach { view.addSubview($0) }
    }
    
    @objc
    private func goBackwards(sender: UIBarButtonItem) { print("go backwards") }
    
    @objc
    private func pressButton(sender: UIButton) { print("go next page") }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tableData[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.setUpCell(with: item)
        return cell
    }
}

extension UIViewController :  UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 92 }
    
}
