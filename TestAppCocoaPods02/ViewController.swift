//  ViewController.swift
//  TestAppCocoaPods02

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()        

        var items = Memo.all().find()
        self.navigationItem.title = String(items.count)
        
        if items.count == 0 {
            let launch = LaunchModels()
            launch.master_memo_insert()
            launch.master_label_insert()
            launch.master_memo_labels_insert()
            
            var items = Memo.all().find()
            for(var i = 0; i < items.count; i++) {
                
                var memo = items[i] as! Memo
                println("-------------")
                println(memo.title)
                for label in memo.labels {
                    label as! Label
                    println(label.name)
                }
                println("-------------")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Segues


    // 戻ってくる時の処理
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        println(segue.identifier)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.identifier)
        
        if(segue.identifier == "showAdd") {
        }
        
        if(segue.identifier == "showEdit") {
            let uitable:UITableView = self.view as! UITableView
            
            if let indexPath = uitable.indexPathForSelectedRow() {
                var items = Memo.all().find()
                var memo  = items[indexPath.row] as! Memo
                
                (segue.destinationViewController as! EditConroller).memoItem = memo
            }
        }
    }
    
    // MARK: - Table View
    override func viewWillAppear(animated: Bool) {
        let tableView = self.view as! UITableView
        tableView.reloadData()
        
        super.viewWillAppear(animated)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var items = Memo.all().find()
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        var items = Memo.all().find()
        var memo  = items[indexPath.row] as! Memo
        
        cell.textLabel!.text = memo.title
        return cell
    }
    
    // 編集開始時
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // Table を編集可能にする
        let uitable:UITableView = self.view as! UITableView
        uitable.setEditing(editing, animated: true)
        
        if editing {
            println("編集中")
        }else {
            println("通常モード")
        }
    }
    
    // 削除処理
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            var items = Memo.all().find()
            var memo  = items[indexPath.row] as! Memo
            
            memo.beginWriting().delete().endWriting()
            tableView.reloadData()
        }
    }
    
}

