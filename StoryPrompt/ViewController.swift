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
    @IBAction func changeNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burps"
        storyPrompt.number = 10
        print(storyPrompt)
        print("Hello World!")
        // Do any additional setup after loading the view.
    }


}

