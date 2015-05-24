//  ExtensionNSDate.swift
//  TestAppCocoaPods02

import Foundation

extension NSDate {
    func toJapanString() ->String{
        var date_formatter: NSDateFormatter = NSDateFormatter()
        date_formatter.locale     = NSLocale(localeIdentifier: "ja")
        date_formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"

        return date_formatter.stringFromDate(self)
    }
}

extension NSDate {
    func toString(#format:String, localeIdentifier:String = "ja_JP") -> String? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        formatter.locale = NSLocale(localeIdentifier: localeIdentifier)
        let dateStr = formatter.stringFromDate(self)
        return dateStr
    }
}