//
//  FormSheetViewController.swift
//  CrappyRotation
//
//  Created by Rob on 8/30/22.
//

import UIKit

class FormSheetViewController: UIViewController {

    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func launch(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PortraitViewController")
        let nav = PortraitNavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }

}

class PortraitNavigationController: UINavigationController {
    override var shouldAutorotate: Bool { false }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }
}
