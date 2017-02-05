//
//  CustomControl.swift
//  ThreeWay
//
//  Created by George Drag on 2/3/17.
//  Copyright © 2017 George Drag. All rights reserved.
//

import UIKit

@IBDesignable public class CustomControl: UIControl {
    
    @IBOutlet var avidLabel: UILabel!
    @IBOutlet var skillLabel: UILabel!
    @IBOutlet var proLabel: UILabel!
    @IBOutlet weak var avidButton: UIButton!
    @IBOutlet weak var skillButton: UIButton!
    @IBOutlet weak var proButton: UIButton!
    @IBOutlet weak var avidImage: UIImageView!
    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var proImage: UIImageView!
    
    var selectedIndex: Int = 0 {
        didSet {
            self.sendActions(for: UIControlEvents.valueChanged)
        }
    }
    
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
        avidLabel.kern(kerningValue: 1.5)
        skillLabel.kern(kerningValue: 1.5)
        proLabel.kern(kerningValue: 1.5)
        updateDisplay()
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomControl", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
   
    @IBAction func avidTouchUp(_ sender: Any) {
        selectedIndex = 0
        updateDisplay()
        
    }
    
    @IBAction func skillTouchUp(_ sender: Any) {
        selectedIndex = 1
        updateDisplay()
        
        
    }
    
    
    @IBAction func proTouchUp(_ sender: Any) {
        selectedIndex = 2
        updateDisplay()
        
}
    
    func updateDisplay(){
        let myGreen = UIColor(red: 0, green: 209, blue: 208, alpha: 1.0)
        switch selectedIndex {
        case 1:
            avidButton.setTitleColor(UIColor.black, for: .normal)
            skillButton.setTitleColor(myGreen, for: .normal)
            proButton.setTitleColor(UIColor.black, for: .normal)
            setView(view: skillImage, hidden: false)
            setView(view: proImage, hidden: true)
            setView(view: avidImage, hidden: true)

            
        case 2:
            avidButton.setTitleColor(UIColor.black, for: .normal)
            skillButton.setTitleColor(UIColor.black, for: .normal)
            proButton.setTitleColor(myGreen, for: .normal)
            setView(view: skillImage, hidden: true)
            setView(view: proImage, hidden: false)
            setView(view: avidImage, hidden: true)
            
        default:
            avidButton.setTitleColor(myGreen, for: .normal)
            skillButton.setTitleColor(UIColor.black, for: .normal)
            proButton.setTitleColor(UIColor.black, for: .normal)
            setView(view: skillImage, hidden: true)
            setView(view: proImage, hidden: true)
            setView(view: avidImage, hidden: false)
            
        }
        
    }
   
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.1, options: .transitionCrossDissolve, animations: {() -> Void in
            view.isHidden = hidden
        }, completion: { _ in })
    }
    
}

extension UILabel {
    func kern(kerningValue:CGFloat) {
        self.attributedText =  NSAttributedString(string: self.text ?? "", attributes: [NSKernAttributeName:kerningValue, NSFontAttributeName:font, NSForegroundColorAttributeName:self.textColor])
    }
}


