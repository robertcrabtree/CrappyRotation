//
//  MainViewController.swift
//  CrappyRotation
//
//  Created by Rob on 8/25/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

//    override var shouldAutorotate: Bool { false }
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }

    @IBAction func presentModal(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FormSheetViewController")
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .formSheet
        present(nav, animated: true)
    }
}

