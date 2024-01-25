import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFromTextFIeld: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var enterButtom: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardHandling))
        view.addGestureRecognizer(tapGesture)
        enterButtom.layer.cornerRadius = 10
        registerForKeyboardNotifications()
    }
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        textFromTextFIeld.text = textField.text
        textField.text = ""
    }
    
    @objc func keyboardHandling() {
        view.endEditing(true)
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboard),name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        if notification.name == UIResponder.keyboardWillShowNotification {
            textField.frame.origin.y = 644 - (keyboardValue.cgRectValue.height / 2)
        }
        if notification.name == UIResponder.keyboardWillHideNotification {
            textField.frame.origin.y = 644
        }
    }
}
