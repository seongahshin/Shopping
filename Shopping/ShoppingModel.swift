//
//  ShoppingModel.swift
//  Shopping
//
//  Created by 신승아 on 2022/08/22.
//

import Foundation
import RealmSwift

class ShoppingModel: Object {
    
    @Persisted var didList: String
    @Persisted var notdidList: String
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(didList: String, notdidList: String) {
        self.init()
        self.didList = didList
        self.notdidList = notdidList
        
    }
}
