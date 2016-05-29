//
//  UIImage+Extension.swift
//  Moon
//
//  Created by YKing on 16/5/29.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension UIImage {

   class func imageWithColor(let color: UIColor, let size: CGSize) -> UIImage {
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    //获取上下文
    let ctx = UIGraphicsGetCurrentContext();
    let  rect = CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(ctx, color.CGColor)
    //在画布上面绘制出来
    CGContextFillRect(ctx, rect)
    //从上下文读取Image信息
    let image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
  }


}
