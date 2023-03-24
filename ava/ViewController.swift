//
//  ViewController.swift
//  ava
//
//  Created by Maxim Soloboev on 24.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")?
        .withTintColor(.systemGray2, renderingMode: .alwaysOriginal))
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        scrollView.backgroundColor = .systemGray6
        scrollView.contentSize = .init(width: view.bounds.width, height: 2500)
        scrollView.delegate = self
        view = scrollView
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        for subview in navigationBar.subviews {
            if let label = subview.subviews.first(where: { $0 is UILabel }) {
                subview.addSubview(imageView)
                
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: 36),
                    imageView.widthAnchor.constraint(equalToConstant: 36),
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16),
                    imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor)
                ])
                break
            }
        }
    }
}
