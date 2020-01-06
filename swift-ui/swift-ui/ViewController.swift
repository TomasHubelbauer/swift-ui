//
//  ViewController.swift
//  swift-ui
//
//  Created by Tomas Hubelbauer on 16/12/2019.
//  Copyright © 2019 Tomas Hubelbauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var radios: [UIRadio] = []
    
    override func loadView() {
        super.loadView()
        var constraints: [NSLayoutConstraint] = []

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        
        constraints.append(scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
        
        // Wrap everything in a view for the scroll view to avoid content size determination issues
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // TODO: Figure out how to make the content auto-size itself based on the children and make the scroll view auto-scroll
        constraints.append(contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor))
        constraints.append(contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor))
        constraints.append(contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor))
        constraints.append(contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor))
        constraints.append(contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor))
        let scrollConstraint = contentView.heightAnchor.constraint(equalTo:
            // This is a roundabout way of making a zero here, because I don't know how else to do it
            scrollView.frameLayoutGuide.topAnchor.anchorWithOffset(to: scrollView.frameLayoutGuide.topAnchor)
        )
        constraints.append(scrollConstraint)
        
        var scroll = CGFloat(16) // Space
        
        let coverImageView = UIImageView()
        coverImageView.image = UIImage(named: "landscape")
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverImageView)
        
        constraints.append(coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
        constraints.append(coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
        constraints.append(coverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
        constraints.append(coverImageView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll + 120))
        
        scroll += 120 // Size
        scroll += 16 // Space
        
        let titleLabel = UILabel()
        titleLabel.text = "How are you today?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 1
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        constraints.append(titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
        constraints.append(titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
        
        scroll += 20 // Size
        scroll += 16 // Space
        
        let subtitle = NSMutableAttributedString(string: "How's it going? Let me know!")
        subtitle.addAttribute(.link, value: "https://google.com/ncr", range: NSRange(location: 16, length: 11))
        subtitle.addAttribute(.underlineColor, value: UIColor.white, range: NSRange(location: 0, length: subtitle.length))
        
        let subtitleTextView = UILabel()
        subtitleTextView.attributedText = subtitle
        subtitleTextView.numberOfLines = 1
        subtitleTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleTextView)
        
        constraints.append(subtitleTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
        constraints.append(subtitleTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
        constraints.append(subtitleTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
        
        scroll += 16 // Size
        scroll += 16 // Space
        
        let options = ["Good", "Well", "Nice", "Awesome", "Ecstatic", "Meh", "Outraged", "Disappointed", "Surprised", "Flabbergasted"]
        for (index, option) in options.enumerated() {
            let optionRadio = UIRadio()
            optionRadio.translatesAutoresizingMaskIntoConstraints = false
            optionRadio.backgroundColor = .white
            contentView.addSubview(optionRadio)
            
            constraints.append(optionRadio.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll + 4))
            constraints.append(optionRadio.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
            constraints.append(optionRadio.widthAnchor.constraint(equalToConstant: 25))
            constraints.append(optionRadio.heightAnchor.constraint(equalToConstant: 25))
            
            radios.append(optionRadio)
            
            let optionButton = UIButton()
            optionButton.setTitle(option, for: .normal)
            optionButton.setTitleColor(.black, for: .normal)
            optionButton.contentHorizontalAlignment = .left
            optionButton.translatesAutoresizingMaskIntoConstraints = false
            optionButton.tag = index
            contentView.addSubview(optionButton)
            
            optionButton.addTarget(self, action: #selector(optionButtonAction), for: .touchUpInside)
            
            constraints.append(optionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
            constraints.append(optionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 48))
            constraints.append(optionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
            
            scroll += 32 // Size
            scroll += 16 // Space
            
            if (option == "Outraged") {
                let wannactivist = NSMutableAttributedString(string: "Have you considered venting your frustration on Twitter?")
                wannactivist.addAttribute(.link, value: "https://google.com/ncr", range: NSRange(location: 48, length: 7))
                wannactivist.addAttribute(.underlineColor, value: UIColor.white, range: NSRange(location: 0, length: wannactivist.length))
            
                let wannactivistTextView = UILabel()
                wannactivistTextView.attributedText = wannactivist
                wannactivistTextView.numberOfLines = 2
                wannactivistTextView.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(wannactivistTextView)
                
                constraints.append(wannactivistTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
                constraints.append(wannactivistTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
                constraints.append(wannactivistTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
                
                scroll += 32 // Size
                scroll += 16 // Space
            }
        }
        
        let answerTextField = UITextField()
        answerTextField.layer.borderColor = UIColor.black.cgColor
        answerTextField.layer.borderWidth = 1
        answerTextField.layer.cornerRadius = 4
        answerTextField.placeholder = "Speak your mind"
        answerTextField.contentVerticalAlignment = .top
        answerTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        answerTextField.leftViewMode = .always
        answerTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        answerTextField.rightViewMode = .always
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(answerTextField)
         
        constraints.append(answerTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
        constraints.append(answerTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
        constraints.append(answerTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
        constraints.append(answerTextField.heightAnchor.constraint(equalToConstant: 128))
        
        scroll += 128 // Size
        scroll += 16 // Space
        
        let disclaimerLabel = UILabel()
        disclaimerLabel.text = "Please do not provide any personal or sensitive information."
        disclaimerLabel.numberOfLines = 2
        disclaimerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(disclaimerLabel)
         
        constraints.append(disclaimerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
        constraints.append(disclaimerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
        constraints.append(disclaimerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
        
        scroll += 32 // Size
        scroll += 16 // Space
        
        let legal = NSMutableAttributedString(string: "Privacy and cookies")
        legal.addAttribute(.link, value: "https://google.com/ncr", range: NSRange(location: 0, length: legal.length))
        legal.addAttribute(.underlineColor, value: UIColor.white, range: NSRange(location: 0, length: legal.length))
    
        let legalTextView = UILabel()
        legalTextView.attributedText = legal
        legalTextView.numberOfLines = 1
        legalTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(legalTextView)
        
        constraints.append(legalTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
        constraints.append(legalTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
        constraints.append(legalTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
        
        scroll += 16 // Size
        scroll += 16 // Space
        
        let submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(submitButton)
        
        submitButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
        
        constraints.append(submitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: scroll))
        constraints.append(submitButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -156))
        constraints.append(submitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
         
        scrollConstraint.constant = scroll
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func optionButtonAction(sender: UIButton!) {
        for (index, radio) in self.radios.enumerated() {
            radio.isSelected = index == sender.tag
        }
    }
    
    @objc func submitButtonAction(sender: UIButton!) {
        // TODO: senderButton.tag
    }
    
    class UIRadio: UIView {
        private var _isSelected = false
        public var isSelected: Bool {
            get {
                return _isSelected
            }
            set {
                _isSelected = newValue
                self.setNeedsDisplay()
            }
        }
        
        override func draw(_ rect: CGRect) {
            let pathWidth = CGFloat(1)
            let path = UIBezierPath(ovalIn: rect.inset(by: UIEdgeInsets(top: pathWidth, left: pathWidth, bottom: pathWidth, right: pathWidth)))
            path.lineWidth = pathWidth
            if _isSelected {
                UIColor.systemBlue.setStroke()
                path.stroke()
                
                let dotWidth = CGFloat(6)
                let dot = UIBezierPath(ovalIn: rect.inset(by: UIEdgeInsets(top: dotWidth, left: dotWidth, bottom: dotWidth, right: dotWidth)))
                UIColor.systemBlue.setFill()
                dot.fill()
                return
            }
            
            UIColor.black.setStroke()
            path.stroke()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
