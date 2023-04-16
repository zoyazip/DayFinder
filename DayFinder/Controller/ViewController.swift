//
//  ViewController.swift
//  DayFinder
//
//  Created by d.chernov on 08/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let info = AppInfo()
    

    @IBOutlet weak var dayUserInput: UITextField!
    
    @IBOutlet weak var monthUserInput: UITextField!
    
    @IBOutlet weak var yearUserInput: UITextField!
    
    @IBOutlet weak var findBtn: UIButton!
    
    @IBOutlet weak var resultUserInput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func findBtnPressed(_ sender: Any) {
        var errorMessage: String = ""
        let whiteColor: UIColor = UIColor(hex: 0xffffff, alpha: 1)
        var isError: Bool = false
        
        findBtn.titleLabel?.text == "Clear" ? clearInputs() : ()
    
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let myDay = Int(dayUserInput.text ?? "0"), let myMonth = Int(monthUserInput.text ?? "0"), let myYear = Int(yearUserInput.text ?? "0") else {
            
            return
        }
        
        if myDay <= 0 || myDay > 31{
            errorMessage = "Day is invalid"
            isError = true
        }
        else if myMonth <= 0 || myMonth > 12{
            errorMessage = "Month is invalid"
            isError = true
        }
        else if myYear <= 0{
            errorMessage = "Year is invalid"
            isError = true
        }
        else{
            errorMessage = ""
            isError = false
        }
        
        
        if isError{
            basicAlert(title: "Oops.. something went wrong:", message: errorMessage)
            clearInputs()
        }
        else{
            resultUserInput.textColor = whiteColor
            
            dateComponents.day = myDay
            dateComponents.month = myMonth
            dateComponents.year = myYear
                    
            guard let myDate = calendar.date(from: dateComponents) else {return}
                    
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_EN")
            dateFormatter.dateFormat = "EEEE"
            
            findBtn.setTitle("Clear", for: .normal)
            let weekday = dateFormatter.string(from: myDate)
            resultUserInput.text = weekday.capitalized
                    
        }
        
    }
    
    
    @IBAction func infoButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "infoSegue", sender: self)
    }
    
    func clearInputs(){
        dayUserInput.text = ""
        monthUserInput.text = ""
        yearUserInput.text = ""
        findBtn.setTitle("Find", for: .normal)
    }
    
/* Alert pop-up */
    
    func basicAlert(title: String?, message: String?){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self.present(alert, animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? InfoViewController {
                destination.recievedAppName = info.appName
                destination.recievedDeveloperName = info.developerName
                destination.recievedCreationDate = info.creationDate
                destination.recievedAppVersion = info.appVersion
                destination.recievedIosComp = info.iosComp
                destination.recievedDescription = info.description
            }
        }
    
}
/* Snippet for HEX colors */

    extension UIColor {
        convenience init(hex: UInt, alpha: CGFloat = 1.0) {
            self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(hex & 0x0000FF) / 255.0,
                      alpha: alpha)
        }
    }
