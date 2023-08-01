//
//  CustomCollectionView.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import UIKit

class CustomCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !(__CGSizeEqualToSize(bounds.size,self.intrinsicContentSize)){
            self.invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
