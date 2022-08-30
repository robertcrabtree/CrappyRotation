//
//  FinalController.swift
//  CrappyRotation
//
//  Created by Rob on 8/25/22.
//

import UIKit

class FinalController: UIViewController {
//
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        print("super.preferredInterfaceOrientationForPresentation:", super.preferredInterfaceOrientationForPresentation.rawValue)
//        print("UIDevice.current.orientation:", UIDevice.current.orientation.rawValue)
//        switch UIDevice.current.orientation {
//        case .landscapeLeft:
//            return .landscapeRight
//        case .landscapeRight:
//            return .landscapeLeft
//        case .portraitUpsideDown:
//            return .portraitUpsideDown
//        default:
//            return .portrait
//        }
//    }
//
//    override var shouldAutorotate: Bool { true }
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        .landscape
//    }

    let scrollView = UIScrollView()

    lazy var imageView = UIImageView(image: UIImage(named: "image"))

    lazy var button = UIButton()

    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


        scrollView.frame = view.frame
        scrollView.contentSize = view.frame.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = .red
        view.addSubview(scrollView)

        imageView.contentMode = .scaleAspectFit
        imageView.frame = scrollView.frame
        imageView.backgroundColor = .yellow
        scrollView.addSubview(imageView)

        button.frame = .init(x: (view.frame.size.width - 100) / 2, y: (view.frame.size.height - 44) / 2, width: 100, height: 44)
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapDismiss(_:)), for: .touchUpInside)

        scrollView.addSubview(button)


        print("FinalController.viewWillAppear: \(view.frame)")
    }

    @objc func didTapDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        UIViewController.attemptRotationToDeviceOrientation()

        print("FinalController.viewDidAppear: \(view.frame)")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        print("FinalController.viewWillTransition: \(size)")

        coordinator.animate { context in
            self.repositionStuff(size: size)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        repositionStuff(size: view.frame.size)
    }

    func repositionStuff(size: CGSize) {
        self.scrollView.frame.size = size
        self.imageView.frame.size = size
        self.scrollView.contentSize = size
        self.scrollView.contentOffset = .zero
        self.scrollView.contentInset = .zero

        self.button.frame = .init(x: (size.width - 100) / 2, y: (size.height - 44) / 2, width: 100, height: 44)

        print("FinalController.repositionStuff: \(view.frame)")
        print("FinalController.repositionStuff image.size: \(imageView.image!.size)")
    }
}

extension FinalController: UINavigationControllerDelegate {
//    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
//        return .landscape
//    }
}
