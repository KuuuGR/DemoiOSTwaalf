//
//  ImageMainingVC.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 22.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class ImageMainingVC: UIViewController {

    
  
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    let model = GoogLeNetPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
        
        
    }

    
    @IBAction func loadImageTapped(_ sender: UIButton) {
        
        if let sceneLabelString = sceneLabel(forImage: imgImage.image!) {
            categoryLabel.text = sceneLabelString
        }
    }
    
    
    func sceneLabel (forImage image:UIImage) -> String? {
        if let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!) {
            guard let scene = try? model.prediction(sceneImage: pixelBuffer) else {fatalError("Unexpected runtime error")}
            return scene.sceneLabel
            
        }
        
        return nil
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


        
}


extension ImageMainingVC: BarsDelegate {
    func top() -> [AnyBarView] {
        return [
            Bar<TitleBarView>() {
                $0.name = "Image Maining"
                $0.mainView.backgroundColor = UIColor.dBlack
                $0.nameLabel.textColor = UIColor.dWhite
            }
        ]
    }
}
        
