//  EditController.swift
//  TestAppCocoaPods02

import UIKit

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func save(sender: AnyObject?) {
        if var memo:Memo = self.memoItem {
            
            memo.title = InputTitle.text
            memo.body  = InputBody.text
            memo.updated_at = NSDate()
            
            var saved:Bool  = memo.save()
            
            if saved {
                println("保存")
            }
        }
    }
    
}

