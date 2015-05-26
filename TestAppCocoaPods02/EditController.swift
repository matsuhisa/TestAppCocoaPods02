//  EditController.swift
//  TestAppCocoaPods02

import UIKit
import Social

class EditConroller:UIViewController {
    
    @IBOutlet weak var LabelCreatedAt: UILabel!
    @IBOutlet weak var LabelUpdatedAt: UILabel!
    @IBOutlet weak var InputTitle: UITextField!
    @IBOutlet weak var InputBody: UITextView!
    @IBOutlet weak var ButtonSave: UIButton!
    
    var memoItem: Memo? {
        didSet {
            //self.configureView()
        }
    }
    
    func configureView() {
        if let memo: Memo = self.memoItem {
            LabelCreatedAt.text = memo.created_at.toJapanString()
            LabelUpdatedAt.text = memo.updated_at.toJapanString()
            InputTitle.text     = memo.title
            InputBody.text      = memo.body
        }
        
        ButtonSave.addTarget(self, action: "save:", forControlEvents: .TouchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "share:")
        self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func share(sender: AnyObject?) {
        
        let activityItem = InputBody.text + " #iPhoneApp"
        let activityViewController = UIActivityViewController(activityItems: [activityItem], applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = {(activityType, completed:Bool, returnedItems:Array!, error:NSError!) in
            if (completed) {
                // ここに完了後の処理を書く
                println("完了！")
            }
        }
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    func save(sender: AnyObject?) {
        if var memo:Memo = self.memoItem {
            
            memo.title = InputTitle.text
            memo.body  = InputBody.text
            memo.updated_at = NSDate()
            
            memo.beginWriting()
            var saved:Bool  = memo.save()
            memo.endWriting()
        }
    }
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.identifier)
    }
    */
    
}

