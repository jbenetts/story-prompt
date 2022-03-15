//
//  ViewController.swift
//  StoryPrompt
//
//  Created by jbenetts on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyPrompt = StoryPromptEntry()
        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burps"
        storyPrompt.number = 10
        print(storyPrompt)
        print("Hello World!")
        // Do any additional setup after loading the view.
    }


}

