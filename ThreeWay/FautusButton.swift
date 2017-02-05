//
//  FautusButton.swift
//  ThreeWay
//
//  Created by George Drag on 2/4/17.
//  Copyright © 2017 George Drag. All rights reserved.
//

import UIKit



@IBDesignable public class FautusButton: UIControl {
    
    @IBInspectable var fautusButtonText: String = "" {
        willSet {
            fautusButtonLabel.text = fautusButtonText.uppercased()
        }
    }
    
@IBOutlet weak var fautusButtonLabel: UILabel!
    
    @IBOutlet weak var caretImage: UIImageView!
    @IBOutlet weak var fautusButton: UIButton!
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FautusButton", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        fautusButtonLabel.kern(kerningValue: 1.5)
        return view
    }
    
    
    @IBAction func fautusButtonTouchDown(_ sender: Any) {
        fautusButtonLabel.textColor = UIColor.darkGray
        fautusButton.backgroundColor = UIColor(red: 0.02, green: 0.05, blue: 0.02, alpha: 0.05)
        let frm: CGRect = caretImage.frame
        let x = frm.origin.x-1
        let y = frm.origin.y-1
        let rect = CGRect(x: x, y: y, width: 17, height: 17)
        caretImage.frame = rect
        fautusButtonLabel.font = fautusButtonLabel.font.withSize(16.5)

    }

    
    @IBAction func fautusButtonTouchUp(_ sender: Any) {
        fautusButtonLabel.textColor = UIColor.black
        fautusButton.backgroundColor = UIColor.clear
        let frm: CGRect = caretImage.frame
        let x = frm.origin.x+1
        let y = frm.origin.y+1
        let rect = CGRect(x: x, y: y, width: 16, height: 16)
        caretImage.frame = rect
        fautusButtonLabel.font = fautusButtonLabel.font.withSize(16)
        self.sendActions(for: UIControlEvents.valueChanged)
    }

   
}
