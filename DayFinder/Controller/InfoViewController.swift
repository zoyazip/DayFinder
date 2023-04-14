//
//  InfoViewController.swift
//  DayFinder
//
//  Created by d.chernov on 14/04/2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    var recievedAppName: String?
    var recievedDeveloperName: String?
    var recievedCreationDate: String?
    var recievedAppVersion: String?
    var recievedIosComp: String?
    var recievedDescription: String?
    
    
    
    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var developerName: UILabel!
    
    @IBOutlet weak var dateOfCreation: UILabel!
    
    @IBOutlet weak var appVersion: UILabel!
    
    @IBOutlet weak var iosCompability: UILabel!
    
    @IBOutlet weak var descriptionField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appName.text = recievedAppName
        developerName.text = recievedDeveloperName
        dateOfCreation.text = recievedCreationDate
        appVersion.text = recievedAppVersion
        iosCompability.text = recievedIosComp
        descriptionField.text = recievedDescription
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
//    }

}
