//
//  UIImage+Extension.swift
//  Moon
//
//  Created by YKing on 16/5/29.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension UIImage {

   class func imageWithColor( _ color: UIColor, size: CGSize) -> UIImage {
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    //获取上下文
    let ctx = UIGraphicsGetCurrentContext();
    let  rect = CGRect(x: 0, y: 0, width: size.width, height: size.height);
    ctx!.setFillColor(color.cgColor)
    //在画布上面绘制出来
    ctx!.fill(rect)
    //从上下文读取Image信息
    let image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image!;
  }
  
  class func imageName(_ name: String) -> (normalImage: UIImage, highLightedImage: UIImage) {
    let image = UIImage(named: name)!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    let imageName  = "\(name)-act"
    let highLightImage = UIImage(named: imageName)!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    return (image, highLightImage)
  }


}
