//
//  DarkModeViewController.swift
//  DayFinder
//
//  Created by d.chernov on 14/04/2023.
//

import UIKit

class DarkModeViewController: UIViewController {

    @IBOutlet weak var darkModeTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func openSettingsBtn(_ sender: Any) {
        if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if self.traitCollection.userInterfaceStyle == .dark {
            darkModeTitle.text = "On"
        } else {
            darkModeTitle.text = "Off"
        }
    }
}


