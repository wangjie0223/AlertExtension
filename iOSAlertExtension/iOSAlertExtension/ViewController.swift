//
//  ViewController.swift
//  iOSAlertExtension
//
//  Created by jqrios on 2022/9/7.
//

import UIKit
import Reusable

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

enum TestEnum: String, CaseIterable {
    case normal = "message 居左显示"
    case adjust = "message 行间距可调"
    case titleLeft = "title 左对齐"
}

class ViewController: UIViewController {
        
    var dataArray: [TestEnum] { TestEnum.allCases }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myTableView)
    }

    private lazy var myTableView: UITableView = {
        let tableView = UITableView.init(frame: .init(x: 0, y: 40, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 40), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: MyTableViewCell.self)
        return tableView
    }()

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MyTableViewCell.self)
        cell.textLabel?.text = dataArray[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(type: dataArray[indexPath.row])
    }
    
    func showAlert(type: TestEnum) {
        
        let msg: String = "UIAlertController的文案居左显示\n我是黑夜里大雨纷飞的人啊 1 “又到一年六月，有人笑有人哭，有人欢乐有人忧愁"
        
        let alertController = UIAlertController.init(title: type.rawValue, message: msg, preferredStyle: .alert)
        let actionC = UIAlertAction.init(title: "确定", style: .default) { a in }
        alertController.addAction(actionC)
        present(alertController, animated: true, completion: nil)
        
        switch type {
        case .normal: alertController.alertMessageTextAlignmentLeft(msg)
        case .adjust:
            let attributedMsg: NSAttributedString? = paragraphStyle(string: msg, lineSpacing: 6)
            alertController.alertMessageTextAlignmentLeft(attributedMsg)
        case .titleLeft:
            alertController.alertTitleTextAlignmentLeft(alertController.title)
        }
    }
    
}

class MyTableViewCell: UITableViewCell, Reusable {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

