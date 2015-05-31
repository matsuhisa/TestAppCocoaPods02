//  LaunchModels.swift
//  TestAppCocoaPods02

import Foundation
import UIKit
import CoreData

class LaunchModels {

    private func plist_data(file_name: String) ->NSDictionary{
        let path:String = NSBundle.mainBundle().pathForResource(file_name, ofType: "plist")!
        var masterDataDictionary:NSDictionary = NSDictionary(contentsOfFile: path)!
        
        return masterDataDictionary
    }
    
    /*
    func master_memo_labels_insert() {
    let app: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context:NSManagedObjectContext = app.managedObjectContext!
    
    var items = Memo.all().find()
    for(var i = 0; i < items.count; i++) {
    var memo = items[i] as! Memo
    
    var items = Label.all().find()
    for(var i = 0; i < items.count; i++) {
    var label = items[i] as! Label
    memo.addLabels(label)
    }
    
    app.saveContext()
    }
    }
    */


    
    func master_memo_labels_insert() {
        var items = Memo.all().find()

        for(var i = 0; i < items.count; i++) {
            var memo = items[i] as! Memo

            println("---------------")
            println(memo.title)

            var labels = Label.all().find()
            for(var i = 0; i < labels.count; i++) {
                var label = labels[i] as! Label
                println("label:" + label.name)
                memo.addLabels(label)
                var saved:Bool = memo.save()
            }
            //memo.beginWriting()
            //memo.endWriting()

            println("---------------")
        }
    }
    
    func master_config_list_insert() {
        var masterData:NSDictionary = self.plist_data("ConfigList")
        
        for(var i=1; i<=masterData.count; i++) {
            let index_name: String = "config" + String(i)
            var item:AnyObject = masterData[index_name]!
            
            var config:Config = Config.create() as! Config
            
            config.name  = item["name"] as! String
            config.value = item["value"] as! NSNumber
            
            config.save()
        }

        // debug
        var items = Config.all().find()
        for(var i = 0; i < items.count; i++) {
            var config = items[i] as! Config

            println(config.name)
            println(config.value)

        }
    
    }
    
    func master_label_insert() {
        var masterData:NSDictionary = self.plist_data("MasterLabel")
        
        for(var i = 1; i<=masterData.count; i++) {
            
            let index_name: String = "label" + String(i)
            var item:AnyObject = masterData[index_name]!
            
            var label:Label = Label.create() as! Label
            
            label.name = item["name"] as! String
            label.uuid = item["uuid"] as! NSNumber
            
            label.save()
        }
        
        // debug
        var items = Label.all().find()
        for(var i = 0; i < items.count; i++) {
            var label = items[i] as! Label
            /*
            println(label.name)
            println(label.uuid)
            */
        }
    }

    
    func master_memo_insert() {
        var masterData:NSDictionary = self.plist_data("MasterMemo")
        
        for(var i = 1; i<=masterData.count; i++) {
            
            let index_name: String = "memo" + String(i)
            var item:AnyObject = masterData[index_name]!
            
            var memo:Memo = Memo.create() as! Memo
            
            memo.title = item["title"] as! String
            memo.body  = item["body"] as! String
            
            memo.beginWriting()
            var saved:Bool = memo.save()
            memo.endWriting()
        }
        
        // debug
        var items = Memo.all().find()
        for(var i = 0; i < items.count; i++) {
            var memo = items[i] as! Memo
            /*
            println(memo.title)
            println(memo.created_at)
            println(memo.updated_at)
            */
        }
    }


}