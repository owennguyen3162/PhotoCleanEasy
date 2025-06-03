//
//  PhotoCleaningVCViewController.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 2/6/25.
//

import UIKit

class PhotoCleaningVCViewController: BaseViewController {

   override func initUI() {
       super.initUI()
       self.view.backgroundColor = .c141414
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        self.goBack()
    }
}
