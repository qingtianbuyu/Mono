//
//  MNPicCell.swift
//  Moon
//
//  Created by YKing on 16/5/29.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNPicCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  
  var pic: MNThumb? {
    didSet {
        imageView.m_setImageWithUrl(pic?.raw, placeHolderName: "place_holder.png")
    }
  }
  
}
