//  ViewController.swift
//  TestAppCocoaPods02

import UIKit

class ViewController: UITableViewController {

    var myToolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()        

        let launch = LaunchModels()
        launch.master_config_list_insert()
        
        // 初期設定
        var items = Memo.all().find()
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
    
    
    // 画面遷移
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
        // データー読み込み
        let tableView = self.view as! UITableView
        tableView.reloadData()
        
        // ボタンを生成する.
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(
            title: "並び替え",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: "dataSortTypeSelect:"
        )
        // UIToolbar を設定
        self.toolbarItems = [myUIBarButtonGreen]
        self.navigationController?.setToolbarHidden(false, animated: false)
        
        //
        super.viewWillAppear(animated)
    }
    
    func dataSortTypeSelect(sender: UIBarButtonItem) {
        var alert = UIAlertController(title: "並び替え", message: "メッセージ", preferredStyle: .ActionSheet)
        
        alert.addAction(UIAlertAction(title: "作成日順", style: UIAlertActionStyle.Default) {
            action in println("作成日順")
        })

        alert.addAction(UIAlertAction(title: "編集日順", style: UIAlertActionStyle.Default) {
            action in println("編集日順")
        })

        alert.addAction(UIAlertAction(title: "あいうえお順", style: UIAlertActionStyle.Default) {
            action in println("あいうえお順")
        })
        
        alert.addAction(UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.Cancel) {
            action in println("キャンセル")
        })
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var items = Memo.all().find()
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("tableView")
        
        let cell  = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        //var items = Memo.all().find()
        var items = Memo.sorted(by: "created_at", ascending: false).all().find()
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

