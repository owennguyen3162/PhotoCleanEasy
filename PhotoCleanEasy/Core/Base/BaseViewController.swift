//
//  BaseViewController.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 14/5/25.
//


import UIKit

protocol IViewController {
    func unmount()
    func initUI()
    func applicationDidBecomeActive()
    func applicationDidEnterBackground()
}

class BaseViewController: UIViewController, IViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initUI()
    }
    
    deinit {
        unmount()
    }
    
    
    func unmount() {}
    func initUI() {}
    func applicationDidBecomeActive(){}
    func applicationDidEnterBackground(){}
    
}
