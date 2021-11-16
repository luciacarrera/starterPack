//
//  TranslateViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit
import LanguageTranslatorV3

class TranslateViewController: UIViewController {
    
    @IBOutlet var inputTextField: UITextField!
    
    @IBOutlet var translateButton: UIButton!
    
    @IBOutlet var transLabel: UILabel!
    
    let transLanguages = ["Arabic":"ar", "Bengali":"bn", "Bosnian":"bs", "Bulgarian":"bg", "Chinese (Simplified)":"zh", "Chinese (Traditional)":"zh-TW", "Croatian":"hr", "Czech":"cs", "Danish":"da", "Dutch":"nl", "English":"en", "Estonian":"et", "Finnish":"fi", "French":"fr", "German":"de", "Greek":"el", "Gujarati":"gu", "Hebrew":"he", "Hindi":"hi", "Hungarian":"hu", "Irish":"ga", "Indonesian":"id", "Italian":"it", "Japanese":"ja", "Korean":"ko", "Latvian":"lv", "Lithuanian":"lt", "Malay":"ms", "Malayalam":"ml", "Maltese":"mt", "Nepali":"ne", "Norwegian Bokmål":"nb", "Polish":"pl", "Portuguese":"pt", "Romanian":"ro", "Russian":"ru", "Sinhala":"si", "Slovak":"sk", "Slovenian":"sl", "Spanish":"es", "Swedish":"sv", "Tamil":"ta", "Telugu":"te", "Thai":"th", "Turkish":"tr", "Ukrainian":"uk", "Urdu":"ur", "Vietnamese":"vi", "Welsh":"cy"]
    var fromLanguage = "English"
    var toLanguage = "Spanish"

    func translate(to: String, from: String) -> String? {
        var output = ""
        let transModel = transLanguages[from]! + "-" + transLanguages[to]!
        //print(transModel)
        let authenticator = WatsonIAMAuthenticator(apiKey: "7-yXBmQ10h_R5NICZvJyOoDxG1NWrg7loABmHg9Zxi0P")
        let languageTranslator = LanguageTranslator(version: "2018-05-01", authenticator: authenticator)
        languageTranslator.serviceURL = "https://api.au-syd.language-translator.watson.cloud.ibm.com/instances/09b1d916-b5e9-4b06-8d20-f0d58800b7cd"
        
        let input = getInput()!

        languageTranslator.translate(text: [input], modelID: transModel) {
          response, error in

          guard let translation = response?.result else {
            output = error?.localizedDescription ?? "unknown error"
            return
          }

            output = translation.translations[0].translation
//            print(output)
        }
        
        return output
    }
    
    
//    @IBAction func translateInput2(_ sender: Any) {
//        let output = translate(to: toLanguage, from: fromLanguage)
//        print(output)
//        if let unwrapped = output {
//            print(output)
//            //transLabel.text = output
//        }
//        transLabel.text = " "
//    }
//
    @IBAction func translateInput() {
//        _ = translate(to: toLanguage, from: fromLanguage)
//        let output = translate(to: toLanguage, from: fromLanguage)
        let output = "test"
        updateTranslation(to: output)
        
    }
    
    
    
//    var translateValue: String? {
//        didSet {
//            updateTranslation()
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        updateTranslation()
    }
    
    func getInput() -> String? {
        let input = inputTextField.text
        return input
    }
//
//    @IBAction func inputViewEditing(_ textField: UITextField) {
//        outputTextView.text = textField.text
//    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        inputTextField.resignFirstResponder()
    }
    
    func updateTranslation(to: String) {
        transLabel.self.text = to
        print("help")
    }

}
