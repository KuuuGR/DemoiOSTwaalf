//
//  TextMainingVC.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 22.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class TextMainingVC: UIViewController {

    @IBOutlet weak var userTextEnterField: UITextView!
    
    @IBAction func analyzeAction(_ sender: UIButton) {
        userTextEnterField.text = "clikłeś"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userTextEnterField.becomeFirstResponder()
        userTextEnterField.selectedTextRange = userTextEnterField.textRange(from: userTextEnterField.beginningOfDocument, to: userTextEnterField.endOfDocument)
        
        
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}





extension TextMainingVC: BarsDelegate {
    func top() -> [AnyBarView] {
        return [
            Bar<TitleBarView>() {
                $0.name = "Text Maining"
                $0.mainView.backgroundColor = UIColor.dBlack
                $0.nameLabel.textColor = UIColor.dWhite
            }
        ]
    }
}
