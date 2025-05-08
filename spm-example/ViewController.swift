//
//  ViewController.swift
//  spm-example
//
//  Created by Jay Lee on 5/7/25.
//

import UIKit
import AIScan

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = Bundle.main.url(forResource: <YOUR_AUTH_FILE_NAME>, withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            
            // Ensure the authentication file used for SDK initialization is not exposed through methods such as app resource extraction.
            AIScanManager.configure(authFileData: data)
        }
        //AIScanManager.analysisTracker = AnalysisTracker()
        AIScanManager.isHapticEnabled = true
    }


    @IBAction func action(_ sender: Any) {
        
        AIScanManager.showCamera(petType: .dog, partType: .eye, guideUrl: "https://resource-core.aiforpetcdn.com/sdk/guide/dog/eye.html") { [weak self] result, error in
            if let error = error {
                return
            } else {
                let alert = UIAlertController(title: "결과", message: result, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self?.present(alert, animated: true)
            }
            
        }
    }
}

