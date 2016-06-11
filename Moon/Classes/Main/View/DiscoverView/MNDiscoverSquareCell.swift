//
//  MNDiscoverSquareCell.swift
//  Moon
//
//  Created by YKing on 16/6/11.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNDiscoverSquareCell: UICollectionViewCell {

  @IBOutlet weak var topLabel: UILabel!
  
  @IBOutlet weak var centerImageView: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var contentLabel: UILabel!
  
  var mode: MNMode? {
    didSet {
      self.centerImageView.m_setImageWithUrl(mode?.group?.logo_url)
      self.titleLabel.text = mode?.group?.name
      self.contentLabel.text = mode?.group?.desc
      let cert_kind_id = mode?.group?.cert_kind_id
      let category = mode?.group?.category ?? ""
      if cert_kind_id == 0 {
        self.topLabel.text  =  "\(category)/内容站"
      } else if cert_kind_id == 1 {
        self.topLabel.text  =  "\(category)/造物主"
      }
      
    }
  }
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
      self.backgroundColor = UIColor.whiteColor()
    }

}
