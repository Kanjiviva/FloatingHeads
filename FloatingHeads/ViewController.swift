//
//  ViewController.swift
//  FloatingHeads
//
//  Created by Steve on 2015-09-30.
//  Copyright © 2015 Steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var floatingButton: Button!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func floatingButton(sender: UIButton) {
        let controller = FloatingMenuControllerViewController(fromView: sender as UIButton)
        controller.buttonItems = [
            Button(image: UIImage(named: "icon-add")),
            Button(image: UIImage(named: "model-4")),
            Button(image: UIImage(named: "model-5")),
            Button(image: UIImage(named: "model-7")),
            Button(image: UIImage(named: "model-8")),
        ]
        presentViewController(controller, animated: true, completion: nil)
    }

}

