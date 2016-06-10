//
//  UIImageView+Extension.swift
//  Moon
//
//  Created by YKing on 16/5/28.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension UIImageView {
  
  func m_setImageWithUrl(urlString: String?,placeHolderName: String) -> Void {
    let placeHolderImage = UIImage(named: placeHolderName)
    guard let urlStr = urlString else{
      image = placeHolderImage
      return
    }
    let url = NSURL.init(string: urlStr)
    sd_setImageWithURL(url , placeholderImage: placeHolderImage)
  }
  
  func m_setImageWithUrl(urlString: String?) -> Void {
      m_setImageWithUrl(urlString, placeHolderName: "place_holder")
  }
  
  
}

