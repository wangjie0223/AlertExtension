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
let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height
let NAVIGATIONBAR_HEIGHT: CGFloat = 44
let IPHONEX_SAFE_HEIGHT: CGFloat = 34
let NaviAndStatusHight: CGFloat = STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT

class ViewController: UIViewController {
    
    let dataArray = ["文案居左显示", "行间距可调", "title左对齐"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(myTableView)
    }

    private lazy var myTableView: UITableView = {
        let tableView = UITableView.init(frame: .init(x: 0, y: STATUSBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT), style: .plain)
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
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(type: indexPath.row)
    }
    
    func showAlert(type: Int) {
        
        let msg: String = "UIAlertController 的文案居左显示我是黑夜里大雨纷飞的人啊 1 “又到一年六月，有人笑有人哭，有人欢乐有人忧愁"
        let alertController = UIAlertController.init(title: "title", message: msg, preferredStyle: .alert)
        let actionC = UIAlertAction.init(title: "确定", style: .default) { a in }
        alertController.addAction(actionC)
        present(alertController, animated: true, completion: nil)
        
        switch type {
        case 0: alertController.alertMessageTextAlignmentLeft(msg)
        case 1:
            let attributedMsg: NSAttributedString? = paragraphStyle(string: msg, lineSpacing: 10)
            alertController.alertMessageTextAlignmentLeft(attributedMsg)
        case 2:
            alertController.alertTitleTextAlignmentLeft(alertController.title)
        default: break
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

