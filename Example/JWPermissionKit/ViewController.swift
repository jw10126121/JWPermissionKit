//
//  ViewController.swift
//  JWPermissionKit
//
//  Created by 10126121@qq.com on 04/09/2019.
//  Copyright (c) 2019 10126121@qq.com. All rights reserved.
//

import UIKit
import SnapKit
import JWPermissionKit

class ViewController: UIViewController {
    
    let menuList = ["相册", "摄像头", "麦克风"]
    
    lazy var listView: UITableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.dataSource = self
        view.delegate = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(listView)
        listView.snp.makeConstraints {
            $0.left.top.bottom.right.equalTo(0)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = menuList[indexPath.row]
        return cell
    }
}


extension ViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        
        let menuText = menuList[indexPath.row]
        
        switch menuText {
        case "相册":

            JWPermission.photos.request { (status) in
                debugPrint(status.description)
            }
            break
            
        case "摄像头":
            JWPermission.camera.request { (status) in
                debugPrint(status.description)
            }
            break
        case "麦克风":
            JWPermission.microphone.request { (status) in
                debugPrint(status.description)
            }
            break
        default:
            break
        }
        

        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
