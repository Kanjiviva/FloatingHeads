//
//  FloatingMenuControllerViewController.swift
//  FloatingHeads
//
//  Created by Steve on 2015-09-30.
//  Copyright © 2015 Steve. All rights reserved.
//

import UIKit

class FloatingMenuControllerViewController: UIViewController {

    enum Direction {
        case Up
        case Down
        case Left
        case Right
        
        func offsetPoint(point: CGPoint, offset: CGFloat) -> CGPoint {
            switch self {
            case .Up:
                return CGPoint(x: point.x, y: point.y - offset)
            case .Down:
                return CGPoint(x: point.x, y: point.y + offset)
            case .Left:
                return CGPoint(x: point.x - offset, y: point.y)
            case .Right:
                return CGPoint(x: point.x + offset, y: point.y)
            }
        }
    }
    
    var buttonDirection = Direction.Up
    var buttonPadding: CGFloat = 70
    var buttonItems = [UIButton]()
    
    let fromView: UIView
    
    // MARK: UIViewController
    
    init(fromView: UIView) {
        self.fromView = fromView
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .OverFullScreen
        modalTransitionStyle = .CrossDissolve
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    let closeButton = Button(image: UIImage(named: "icon-close"), backgroundColor: UIColor.flatRedColor)
    
    func configureButtons() {
        let parentController = presentingViewController!
        let center = parentController.view.convertPoint(fromView.center, fromView: fromView.superview)
        
        closeButton.center = center
        
        for (index, button) in buttonItems.enumerate() {
            button.center = buttonDirection.offsetPoint(center, offset: buttonPadding * CGFloat(index+1))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurredView.frame = view.bounds
        view.addSubview(blurredView)
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: "handleCloseMenu:", forControlEvents: .TouchUpInside)
        view.addSubview(closeButton)
        
        for button in buttonItems {
            view.addSubview(button)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureButtons()
    }
    
    func handleCloseMenu(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil);
    }
}
