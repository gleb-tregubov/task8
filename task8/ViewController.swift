//
//  ViewController.swift
//  task8
//
//  Created by Gleb Tregubov on 23.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
    
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        view.addSubview(scrollView)
        navigationController?.navigationBar.setLargeTitleRightView()
        
    }
}

extension UINavigationBar {
    func setLargeTitleRightView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
            guard let largeTitleView = self.subviews.first(where: {
                $0.isKind(of: UINavigationBarLargeTitleView.self)
            }) else { return }
            
            let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tintColor = .lightGray
            
            largeTitleView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 36),
                imageView.heightAnchor.constraint(equalToConstant: 36),
                imageView.trailingAnchor.constraint(equalTo: largeTitleView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                imageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -6)
            ])
        }
    }
}
