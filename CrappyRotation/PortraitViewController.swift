//
//  PortraitViewController.swift
//  CrappyRotation
//
//  Created by Rob on 8/25/22.
//

import UIKit

class PortraitViewController: UIViewController {

    override var shouldAutorotate: Bool {
        true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func launch(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FinalController")
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        present(nav, animated: true)
    }
}
