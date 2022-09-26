//
//  ViewController.swift
//  ReverseWords
//
//  Created by Beavean on 26.09.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var enteredStringTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var textLabelBottomLineView: UIView!
    @IBOutlet weak var reverseButtonBottomConstraint: NSLayoutConstraint!

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupKeyboardHiding()
    }
    
    //MARK: - IBActions
    
    @IBAction func reverseButtonPressed(_ sender: UIButton) {
        reverseEnteredString()
    }
    
    //MARK: - Helpers
    
    private func reverseEnteredString() {
        if let text = resultLabel.text, !text.isEmpty {
            enteredStringTextField.text = ""
            resultLabel.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
            textFieldDidChange(enteredStringTextField)
        } else {
            guard let enteredString = enteredStringTextField.text, !enteredString.isEmpty else { return }
            let parts = enteredString.components(separatedBy: " ")
            let reversed = parts.enumerated().map { String($1.reversed()) }
            resultLabel.text = reversed.joined(separator: " ")
            reverseButton.setTitle("Clear",for: .normal)
        }
    }
    
    //MARK: - Setup
    
    private func configure() {
        enteredStringTextField.delegate = self
        enteredStringTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
        reverseButton.isUserInteractionEnabled = false
        resultLabel.text = ""
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: - Selectors
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow() {
        reverseButtonBottomConstraint.isActive = false
        reverseButtonBottomConstraint = reverseButton.topAnchor.constraint(equalTo: textLabelBottomLineView.bottomAnchor, constant: 72)
        reverseButtonBottomConstraint.isActive = true
    }
    
    @objc func keyboardWillHide() {
        reverseButtonBottomConstraint.isActive = false
        reverseButtonBottomConstraint = reverseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        reverseButtonBottomConstraint.isActive = true
    }
    
    //MARK: - TextField Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        reverseEnteredString()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let textIsEntered = textField.text != ""
        reverseButton.isUserInteractionEnabled = textIsEntered
        reverseButton.isHighlighted = !textIsEntered
        textLabelBottomLineView.backgroundColor = textIsEntered ? .tintColor : .separator
    }
}





