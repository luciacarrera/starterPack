//
//  PhrasesViewController.swift
//  starterPack
//
//  Created by Joseph Wills on 10/14/21.
//

import UIKit
import LanguageTranslatorV3

class PhrasesViewController: UIViewController {
//    , UICollectionViewDelegate, UICollectionViewDataSource
    
    var user: User!
//    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var fromText: UITextView!
    @IBOutlet var toText: UITextView!
    
    let transLanguages = ["Arabic":"ar", "Bengali":"bn", "Bosnian":"bs", "Bulgarian":"bg", "Chinese (Simplified)":"zh", "Chinese (Traditional)":"zh-TW", "Croatian":"hr", "Czech":"cs", "Danish":"da", "Dutch":"nl", "English":"en", "Estonian":"et", "Finnish":"fi", "French":"fr", "German":"de", "Greek":"el", "Gujarati":"gu", "Hebrew":"he", "Hindi":"hi", "Hungarian":"hu", "Irish":"ga", "Indonesian":"id", "Italian":"it", "Japanese":"ja", "Korean":"ko", "Latvian":"lv", "Lithuanian":"lt", "Malay":"ms", "Malayalam":"ml", "Maltese":"mt", "Nepali":"ne", "Norwegian Bokmål":"nb", "Polish":"pl", "Portuguese":"pt", "Romanian":"ro", "Russian":"ru", "Sinhala":"si", "Slovak":"sk", "Slovenian":"sl", "Spanish":"es", "Swedish":"sv", "Tamil":"ta", "Telugu":"te", "Thai":"th", "Turkish":"tr", "Ukrainian":"uk", "Urdu":"ur", "Vietnamese":"vi", "Welsh":"cy"]
    var fromLanguage = "English"
    var toLanguage = "Spanish"
    var currentIndex: Int = 0
    
    let phrases: [String] = [
        "How are you?",
        "I would like ___",
        "Where is the restroom?",
        "What time is it?",
        "Where can I find a grocery store?",
        "How much does this cost?"
    ]
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return phrases.count // How many cells to display
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
//        myCell.backgroundColor = UIColor.white
//        return myCell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       print("User tapped on item \(indexPath.row)")
//    }

    func translate(to: String, from: String, input: String) -> String? {
        var output = ""
        let transModel = transLanguages[from]! + "-" + transLanguages[to]!
        let authenticator = WatsonIAMAuthenticator(apiKey: "7-yXBmQ10h_R5NICZvJyOoDxG1NWrg7loABmHg9Zxi0P")
        let languageTranslator = LanguageTranslator(version: "2018-05-01", authenticator: authenticator)
        languageTranslator.serviceURL = "https://api.au-syd.language-translator.watson.cloud.ibm.com/instances/09b1d916-b5e9-4b06-8d20-f0d58800b7cd"
        languageTranslator.translate(text: [input], modelID: transModel) {
          response, error in

          guard let translation = response?.result else {
            output = error?.localizedDescription ?? "unknown error"
            return
          }

            output = translation.translations[0].translation
        }
        sleep(3)
        return output
    }
    
    var translations = [String]()
    
    func getPhrases() -> [String] {
        for phrase in phrases {
            translations.append(translate(to: toLanguage, from: fromLanguage, input: phrase)!)
        }
        return translations
    }
    
    @IBAction func nextPhrase(_ sender: UIButton) {
        currentIndex += 1
        if currentIndex == phrases.count {
            currentIndex = 0
        }
        let phrase: String = phrases[currentIndex]
        let translation: String = translations[currentIndex]
        fromText.text = phrase
        toText.text = translation
    }
    
    func updateLabels() {
        fromLabel.text = fromLanguage
        toLabel.text = toLanguage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        translations = getPhrases()
        fromText.text = phrases[currentIndex]
        toText.text = translations[currentIndex]


//        let view = UIView()
//        view.backgroundColor = .white
//
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 300, height: 200)
//        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//        collectionView?.backgroundColor = UIColor.white
//
//        collectionView?.dataSource = self
//        collectionView?.delegate = self
//
//        view.addSubview(collectionView ?? UICollectionView())
//        collectionView.backgroundColor = UIColor.lightGray
//
//
//        self.view = view
    }

}
