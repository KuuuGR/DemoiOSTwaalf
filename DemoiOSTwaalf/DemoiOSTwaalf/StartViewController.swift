//
//  ViewController.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var yourRebuses: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  //      playButton.backgroundColor = UIColor.fGreenBarBackground
  //      yourRebuses.backgroundColor = UIColor.fRedYourRebusesBackground
   
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Levels", bundle: nil).instantiateInitialViewController() {
            UIApplication.mainNC?.pushViewController(vc, animated: false)
        }

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

extension StartViewController: BarsDelegate {
    func top() -> [AnyBarView] {
        return [
            Bar<TitleBarView>() {
                $0.name = "test"
                $0.mainView.backgroundColor = UIColor.red
            }
        ]
    }
}
//extension StartViewController: BarsDelegate {
//    func top() -> [AnyBarView] {
//        return []
//    }
//}

