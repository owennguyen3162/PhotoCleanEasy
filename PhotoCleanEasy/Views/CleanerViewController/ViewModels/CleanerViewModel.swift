//
//  CleanerViewModel.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 19/5/25.
//

import UIKit

class CleanerViewModel {
    
    public func caculatorDiskSpaceInBytes() -> String {
        let usedSpaceInBytes = UIDevice.current.usedDiskSpaceInBytes.sizeFormat(showingUnit: false)
        let totalSpaceInBytes = UIDevice.current.totalDiskSpaceInBytes.sizeFormat(showingUnit: false)
        return "\(usedSpaceInBytes) / \(totalSpaceInBytes) GB used"
    }
}
