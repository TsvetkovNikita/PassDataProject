//
//  ViewController.swift
//  PassDataProject
//
//  Created by Nikita Tsvetkov on 21/09/2019.
//  Copyright © 2019 Nikita Tsvetkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var returnLabel: UILabel!
    @IBAction func pressNextButton(_ sender: Any) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
        
    }
    
    @IBAction func unwindToMainScreen(segue:UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard let svc = segue.source as? SecondViewController else { return }
        self.returnLabel.text = svc.label.text
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        dvc.login = loginTextField.text
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

