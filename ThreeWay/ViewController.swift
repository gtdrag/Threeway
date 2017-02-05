//
//  ViewController.swift
//  ThreeWay
//
//  Created by George Drag on 2/3/17.
//  Copyright © 2017 George Drag. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var threeWayToggle: CustomControl!
    
    @IBOutlet weak var fautusButton: FautusButton!
    
    @IBAction func fautusButtonTouchUp(_ sender: Any) {
        let alert = UIAlertController(title: "Button", message:String("touch up"), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func valueChanged() {
        let alert = UIAlertController(title: "Selected", message:String(threeWayToggle.selectedIndex), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        
        fautusButton.fautusButtonText = "login"
            super.viewDidLoad()

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

