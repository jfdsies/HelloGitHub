//
//  TextStatsViewController.swift
//  labeltest
//
//  Created by sora on 14-9-24.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class TextStatsViewController: UIViewController {
    @IBOutlet weak var colorfulCharactersLabel: UILabel!
    @IBOutlet weak var outlinedCharactersLabel: UILabel!
    
    var textToAnalyze = NSAttributedString()

    func setTextToAnalyze(textToAnalyze:NSAttributedString) {
        self.textToAnalyze = textToAnalyze
        updateUI()
    }
    
    func charactersWithAttribute(attributeName:NSString) -> NSMutableAttributedString {
        var characters = NSMutableAttributedString()
        
        var index = 0
        while index < textToAnalyze.length {
            var range = NSRange(location: 0, length: 0)
            var value:AnyObject? = textToAnalyze.attribute(attributeName, atIndex: index, effectiveRange: &range)
            if let theValue: AnyObject = value {
                characters.appendAttributedString(textToAnalyze.attributedSubstringFromRange(range))
                index = range.location + range.length
            } else {
                index++
            }
        }
        
        return characters
    }
    
    func updateUI() {
        colorfulCharactersLabel.text = "\(charactersWithAttribute(NSForegroundColorAttributeName).length) colorful characters"
        outlinedCharactersLabel.text = "\(charactersWithAttribute(NSStrokeWidthAttributeName).length) outlined characters"
    }
    
    override func viewWillAppear(animated: Bool) {
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textToAnalyze = NSAttributedString(string: "test", attributes: [
            NSForegroundColorAttributeName:UIColor.greenColor(),
            NSStrokeWidthAttributeName: -3])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
