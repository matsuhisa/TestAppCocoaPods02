//  Label.swift
//  TestAppCocoaPods02

import Foundation
import CoreData

class Label: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var uuid: NSNumber
    @NSManaged var color: String
    @NSManaged var memo: Memo

}
