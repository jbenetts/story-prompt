//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by jbenetts on 3/17/22.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPromptTextView: UITextView!
    var storyPrompt = StoryPromptEntry()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyPrompt.noun = "toaster"
        storyPrompt.verb = "swims"
        storyPrompt.adjective = "smelly"
        storyPrompt.number = 7
        // Do any additional setup after loading the view.
        storyPromptTextView.text = storyPrompt.description
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
