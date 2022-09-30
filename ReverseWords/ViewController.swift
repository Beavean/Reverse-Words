//
//  ViewController.swift
//  ReverseWords
//
//  Created by Beavean on 26.09.2022.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var enteredStringTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var textLabelBottomLineView: UIView!
    @IBOutlet weak var reverseButtonBottomConstraint: NSLayoutConstraint!
    
    //MARK: - Properties
    
    var processedString: String?
    let reverseButtonConstraintConstant: CGFloat = 40
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupKeyboardHiding()
    }
    
    //MARK: - Private methods
    
    private func configure() {
        enteredStringTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        reverseButton.isUserInteractionEnabled = false
        resultLabel.text = ""
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func processEnteredString() {
        guard let enteredString = enteredStringTextField.text, !enteredString.isEmpty else { return }
        if enteredString == processedString {
            clearInput()
        } else {
            processedString = enteredStringTextField.text
            resultLabel.text = reverseEnteredString(enteredString)
        }
        textFieldDidChange()
    }
    
    private func reverseEnteredString(_ string: String) -> String {
        let parts = string.components(separatedBy: " ")
        let reversed = parts.enumerated().map { String($1.reversed()) }
        return reversed.joined(separator: " ")
    }
    
    private func clearInput() {
        enteredStringTextField.text = ""
        resultLabel.text = ""
    }
    
    //MARK: - Actions
    
    @IBAction func reverseButtonPressed() {
        processEnteredString()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow() {
        reverseButtonBottomConstraint.isActive = false
        reverseButtonBottomConstraint = reverseButton.topAnchor.constraint(equalTo: textLabelBottomLineView.bottomAnchor, constant: reverseButtonConstraintConstant + reverseButton.frame.height)
        reverseButtonBottomConstraint.isActive = true
    }
    
    @objc func keyboardWillHide() {
        reverseButtonBottomConstraint.isActive = false
        reverseButtonBottomConstraint = reverseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -reverseButtonConstraintConstant)
        reverseButtonBottomConstraint.isActive = true
    }
    
    @objc func textFieldDidChange() {
        let textIsEntered = !(enteredStringTextField.text?.isEmpty ?? true)
        reverseButton.isUserInteractionEnabled = textIsEntered
        reverseButton.isEnabled = textIsEntered
        textLabelBottomLineView.backgroundColor = textIsEntered ? .tintColor : .separator
        let reverseButtonTitle = enteredStringTextField.text == processedString ? "Clear" : "Reverse"
        reverseButton.setTitle(reverseButtonTitle, for: .normal)
    }
    
    //MARK: - TextField Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        processEnteredString()
        return true
    }
}
