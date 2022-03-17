//
//  ViewController.swift
//  StoryPrompt
//
//  Created by jbenetts on 3/15/22.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    let storyPrompt = StoryPromptEntry()
    //Items
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var storyPromptImageView: UIImageView!
    //Action Items as functions
    //Change the number label depending on the slider
    @IBAction func changeNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    //Assign a value depending on what is selected on the pill
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex){
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
        print(storyPrompt.genre)
    }
    //Keyboard when is toached
    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        if storyPrompt.isValid(){ //We check if the storyPrompt is valid, at leats one field
            print(storyPrompt)
        } else { //We create the alert for an error message
            let alert = UIAlertController(title: "Invalid Story Prompt", message: "Please fill at least one field   ", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: {action in
            })
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        numberSlider.value = 7.5
        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burps"
        storyPrompt.number = Int(numberSlider.value)
        storyPromptImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        storyPromptImageView.addGestureRecognizer(gestureRecognizer)
        // nounTextField.delegate = self (This is a way to delegate from code)
        // Do any additional setup after loading the view.
    }
    func updateStoryPrompt(){
        storyPrompt.noun = nounTextField.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }
    @objc func changeImage(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true //Indicate that we want the default keyboard behaviour
    }
}

extension ViewController : PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty{
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self){
                itemProvider.loadObject(ofClass: UIImage.self){
                    [weak self] image, error in guard let image = image as? UIImage else{
                        return
                    }
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                    }
                }
            }
        }
    }
}

/*
//This only works if the user dismiss the keyboard
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        storyPrompt.noun = nounTextField.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
        return true //Indicate that we want the default keyboard behaviour
    }
}
*/
