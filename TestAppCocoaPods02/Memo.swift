//  Memo.swift
//  TestAppCocoaPods02

import Foundation
import CoreData

class Memo: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var body: String
    @NSManaged var created_at: NSDate
    @NSManaged var updated_at: NSDate
    @NSManaged var labels: NSMutableSet

    // 初期値：NSDate
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created_at = NSDate()
        self.updated_at = self.created_at
    }

    func addLabels(value:Label) {
        var items = self.mutableSetValueForKey("labels")
        items.addObject(value)
    }
    

}
