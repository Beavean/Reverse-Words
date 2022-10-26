//
//  ReverseWordsViewController.swift
//  ReverseWords
//
//  Created by Beavean on 26.09.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var enteredStringTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textLabelBottomLineView: UIView!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var customFilterTextField: UITextField!
    @IBOutlet weak var defaultInformationLabel: UILabel!
    
    //MARK: - Properties
    
    private let viewModel = ReverseWordsViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupKeyboardHiding()
    }
    
    //MARK: - Private methods
    
    private func configure() {
        enteredStringTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        customFilterTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        resultLabel.text = ""
    }
    
    private func setupKeyboardHiding() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func processEnteredString() {
        guard let enteredString = enteredStringTextField.text else { return }
            switch filterSegmentedControl.selectedSegmentIndex {
            case 1:
                resultLabel.text = viewModel.reverseInputUsingCustomFilter(string: enteredString, filter: customFilterTextField.text)
            case 0:
                resultLabel.text = viewModel.reverseInputUsingDefaultFilter(string: enteredString)
            default:
                break
        }
    }
    
    //MARK: - Actions
    
    @IBAction func filterSegmentedControlChanged() {
        processEnteredString()
        switch filterSegmentedControl.selectedSegmentIndex {
        case 1:
            customFilterTextField.isHidden = false
            defaultInformationLabel.isHidden = true
        case 0:
            customFilterTextField.isHidden = true
            defaultInformationLabel.isHidden = false
        default:
            break
        }
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    private func textFieldDidChange() {
        let textIsEntered = enteredStringTextField.text?.isEmpty == false
        textLabelBottomLineView.backgroundColor = textIsEntered ? .tintColor : .separator
        processEnteredString()
    }
}

