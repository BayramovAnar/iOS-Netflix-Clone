//
//  TitlePreviewViewController.swift
//  Netflix
//
//  Created by Anar Bayramov on 3/24/22.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private let downloadButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let overviewLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
       // label.textAlignment = NSTextAlignment.
        label.text = "This is the best movie ever to watch as a kid"
        return label
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Harry Potter"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(overviewLabel)
        view.addSubview(titleLabel)
        view.addSubview(downloadButton)
        
        configureConstraints()
        
    }
    
    private func configureConstraints(){
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overviewLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.heightAnchor.constraint(equalToConstant: 40),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 130),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 30)
            
        ]
        
        NSLayoutConstraint.activate(downloadButtonConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(webViewConstraints)
    }
    
    
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        guard let url = URL(string: "https://youtube.com/embed/\(model.youtubeView.id.videoId)") else{return}
        webView.load(URLRequest(url: url))
    }

}
