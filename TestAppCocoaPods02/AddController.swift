//  AddController.swift
//  TestAppCocoaPods02

import UIKit

class AddController:UIViewController {
    
    @IBOutlet weak var InputTitle: UITextField!
    @IBOutlet weak var InputBody: UITextView!
    @IBOutlet weak var ButtonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonSave.addTarget(self, action: "save:", forControlEvents: .TouchUpInside)
    }
    
    func save(sender: AnyObject?) {
        var new_memo:Memo = Memo.create() as! Memo
        new_memo.title = "無題"
        if (InputTitle.text != "") {
            new_memo.title = InputTitle.text
        }
        new_memo.body = InputBody.text

        new_memo.beginWriting()
        new_memo.save()
        new_memo.endWriting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
