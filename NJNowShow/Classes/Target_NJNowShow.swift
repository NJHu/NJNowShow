//
//  Target_NJNowShow.swift
//  NJNowShow
//
//  Created by HuXuPeng on 2018/7/10.
//

import UIKit
import NJKit

@objc class Target_NJNowShow: NSObject {
    @objc func Action_mainViewController(params: [String: AnyObject]) -> UIViewController? {
        
        let childController = NJNowShowHomeController(tableViewStyle: UITableViewStyle.plain)
        let nav = NJNavigationController(rootViewController: childController)
        
        childController.tabBarItem.image = UIImage.nj_image(name: "tab_homepage_nor", bundleClass: Target_NJNowShow.self)
        childController.tabBarItem.selectedImage = UIImage.nj_image(name: "tab_homepage_press", bundleClass: Target_NJNowShow.self)
        childController.tabBarItem.title = "NOWShow"
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3);
        
        return nav
    }
}
