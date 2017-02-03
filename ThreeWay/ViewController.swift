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
    
    @IBAction func valueChanged() {
        let alert = UIAlertController(title: "Selected", message:String(threeWayToggle.selectedIndex), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

