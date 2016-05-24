//
//  MNExploreEntityList.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit
import Alamofire

class MNExploreEntityList {
  
  var start: Int = 1
  var entity_list: [MNExploreEntity]?
  
  func loadExploreEntityList(start:String) {
    
    let header = [
      "HTTP-AUTHORIZATION":"9da505a1202111e6b4e7525400b42a60"
    ]
    let url = "http://mmmono.com/api/v3/recommendation/?start=1"
    Alamofire.request(.GET, url ,headers:header)
      .validate()
      .responseJSON { (response) in
        switch response.result {
        case .Success:
          let value = response.result.value
          //遍历字典数组,处理explore数据
          guard let array = (value as! [String : AnyObject])["entity_list"] as?[[String : AnyObject]]  else {
            print("error")
            return
          }
          
          for dict in array {
            let entity = MNExploreEntity(dict: dict)
            self.entity_list?.append(entity)
          }
          
          print(self.entity_list?.count)
          
          
          
        case .Failure(_):
          print(response.result.value)
        }
        
        
        
    }
  
  }
  
  
  
  
  
}
