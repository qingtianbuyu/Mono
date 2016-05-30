//
//  String+Extension.swift
//  Moon
//
//  Created by YKing on 16/5/30.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension String {

  func height(size: CGSize, systemFontOfSize: CGFloat) -> CGFloat {
    // 计算文字的高度
    let textH = self.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(systemFontOfSize)], context: nil).size.height
    return textH
  }

}
