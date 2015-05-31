//  AddController.swift
//  TestAppCocoaPods02

import UIKit

class AddController:UIViewController {
    
    @IBOutlet weak var InputTitle: UITextField!
    @IBOutlet weak var InputBody: UITextView!
    @IBOutlet weak var ButtonSave: UIButton!
    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIToolbar は隠す
        self.navigationController?.setToolbarHidden(true, animated: false)
        
        ButtonSave.addTarget(self, action: "save:", forControlEvents: .TouchUpInside)
    }


    func save(sender: AnyObject?) {
        var new_memo:Memo = Memo.create() as! Memo
        new_memo.title = "無題"
        if (InputTitle.text != "") {
            new_memo.title = InputTitle.text
        }
        new_memo.body = InputBody.text
        new_memo.save()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
