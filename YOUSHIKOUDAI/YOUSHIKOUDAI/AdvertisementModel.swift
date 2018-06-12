//
//  AdvertisementModel.swift
//  YOUSHIKOUDAI
//
//  Created by JustinChou on 2018/6/12.
//  Copyright © 2018 JustinChou. All rights reserved.
//

import Foundation
import ObjectMapper

class AdvertisementModel: Mappable {
    var image: String?
    var text: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        image   <- map["image"]
        text    <- map["text"]
    }
}
