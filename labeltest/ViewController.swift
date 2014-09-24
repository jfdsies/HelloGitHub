//
//  ViewController.swift
//  labeltest
//
//  Created by sora on 23/9/14.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelBody: UITextView!
    @IBOutlet weak var headTitle: UILabel!
    @IBOutlet weak var outlineButton: UIButton!

    @IBAction func changeBodySelectionColorToMatchBackgroundOfButton(sender: UIButton) {
        labelBody.textStorage.addAttribute(NSForegroundColorAttributeName, value: sender.backgroundColor!, range: labelBody.selectedRange)
    }
    
    @IBAction func outlineBodySelectionText() {
        labelBody.textStorage.addAttributes(
            [NSStrokeWidthAttributeName: -3,
             NSStrokeColorAttributeName: UIColor.blackColor()
            ], range: labelBody.selectedRange)
    }
    
    @IBAction func unoutlineBodySelectionText() {
        labelBody.textStorage.removeAttribute(NSStrokeWidthAttributeName, range: labelBody.selectedRange)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var title:NSMutableAttributedString = NSMutableAttributedString(string: outlineButton.currentTitle!)
        title.setAttributes([
            NSStrokeWidthAttributeName: 3,
            NSStrokeColorAttributeName: outlineButton.tintColor!], range: NSMakeRange(0, title.length))
        outlineButton.setAttributedTitle(title, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

