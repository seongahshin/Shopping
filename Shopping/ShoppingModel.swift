//
//  ShoppingModel.swift
//  Shopping
//
//  Created by 신승아 on 2022/08/22.
//

import Foundation
import RealmSwift

class ShoppingModel: Object {
    
    @Persisted var buyList: String
    @Persisted var didList: Bool = false
    @Persisted var favoriteList: Bool = false
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(buyList: String) {
        self.init()
        self.buyList = buyList
    }
}
