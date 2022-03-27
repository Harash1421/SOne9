import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_tvText:UILabel!
    @IBOutlet weak var main_buChange:UIButton!
    //Language Variable
    var currentLang = UserDefaults.standard.string(forKey: "currentLanguage")
    
    var language = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        main_tvText.text = NSLocalizedString("How Are You", comment: "Hello")
        
        main_buChange.setTitle(NSLocalizedString("ChangeLanguage", comment: ""), for: .normal)
        
        //If Current Language
        language = currentLang!
        if(currentLang != nil){
            languages(language: language)
        }else{
            languages(language: "en")
        }
        
    }
    
    //Button Change
    @IBAction func main_buChange(_ sender:Any){
        showAlert()
    }
    
    //Show Alert
    func showAlert(){
        let alert = UIAlertController(title: nil, message: "Choose Language", preferredStyle: .alert)
        
        //Arabic
        let arabic = UIAlertAction(title: "Arabic", style: .default) { action in
            self.languages(language: "ar")
        }
        
        //English
        let english = UIAlertAction(title: "English", style: .default) { action in
            self.languages(language: "en")
        }
        
        //German
        let german = UIAlertAction(title: "Deutch", style: .default) { action in
            self.languages(language: "de")
        }
        
        //Add Action
        alert.addAction(arabic)
        alert.addAction(english)
        alert.addAction(german)
        present(alert, animated: true)
    }
    
    //Language Function
    func languages(language:String){
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = Bundle.init(path: path!)! as Bundle
        self.main_tvText.text = bundle.localizedString(forKey: "HowAreYou", value: nil, table: nil)
        self.main_buChange.setTitle(bundle.localizedString(forKey: "ChangeLanguage", value: nil, table: nil), for: .normal)
        
        UserDefaults.standard.set(language, forKey: "currentLanguage")
    }
}

