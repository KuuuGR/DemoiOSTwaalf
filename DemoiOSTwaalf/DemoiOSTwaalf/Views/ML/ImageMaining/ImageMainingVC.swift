//
//  ImageMainingVC.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 22.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import CoreML
import Vision


class ImageMainingVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageToAnalize: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var confidenceLabel: UILabel!
    
    
    let model = GoogLeNetPlaces()
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func processingImageTapped(_ sender: UIButton) {
        if imageToAnalize.image != nil {
            getImage(image: imageToAnalize.image!)
        }
    }
    
    @IBAction func loadImageTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        //imageToAnalize.contentMode = .scaleAspectFit
    }
    

    //get the image by name
    
    func getImage(image : UIImage){
        categoryLabel.text = "Please wait.."
        //set up the model
        guard let model = try? VNCoreMLModel(for: GoogLeNetPlaces().model) else{
            return
        }
        //create a vision request
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else{
                return
            }
            //examine convidence level
            
            for result in results{
                print("\(result.identifier) and confidence level \(result.confidence * 100)")
            }
            
            let firstResult = results.first
            print("here i am")
            //update text lable when async thread is complete
            DispatchQueue.main.async {
                self.categoryLabel.text =  firstResult?.identifier
                
                let confidenceValue = (firstResult?.confidence)!*100
                var confLabelText = String("confidence level equals ")
                confLabelText.append(String(format: "%.1f", confidenceValue))
                confLabelText.append(" %")
                self.confidenceLabel.text = confLabelText
            }
            
        }
        guard let ciImage = CIImage(image: image) else {
            return
        }
        
        //run the google google model here
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [ : ])
        
        //create a bg thread
        DispatchQueue.global().async {
            do{
                try handler.perform([request])
                
            }catch{
                print(error)
            }
        }
    }
        
    
    
    
    // MARK: - UIImagePickerControllerDelegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageToAnalize.image = pickedImage
            imageToAnalize.contentMode = .scaleAspectFit
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
        
