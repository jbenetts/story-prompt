//
//  ViewController.swift
//  StoryPrompt
//
//  Created by jbenetts on 3/15/22.
//

import UIKit

class ViewController: UIViewController {
    //Items
    let storyPrompt = StoryPromptEntry()
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
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
    }
    //Keyboard when is toached
    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        print(storyPrompt)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        numberSlider.value = 7.5
        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burps"
        storyPrompt.number = Int(numberSlider.value)
        print(storyPrompt)
        // nounTextField.delegate = self   (This is a way to delegate from code
        // Do any additional setup after loading the view.
    }
    func updateStoryPrompt(){
        storyPrompt.noun = nounTextField.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true //Indicate that we want the default keyboard behaviour
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
