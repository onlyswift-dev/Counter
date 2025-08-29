//
//  ViewController.swift
//  Counter
//
//  Created by Александр Москалев on 20.08.2025.
//

import UIKit


final class ViewController: UIViewController {
    
    private var count = 0
    
    @IBOutlet private weak var textField: UILabel!
    @IBOutlet private weak var counterHistory: UITextView!
    @IBOutlet private weak var counterButton: UIButton!
    @IBOutlet private weak var counterPlusOne: UIButton!
    @IBOutlet private weak var counterMinusOne: UIButton!
    @IBOutlet private weak var reset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = "0"
        counterHistory.text = "История изменений:\n"
        counterHistory.isEditable = false
        counterHistory.isScrollEnabled = true
    }
    
    private func increaseCount() {
        count += 1
        textField.text = String(count)
        appendHistory("Значение изменено на +1")
    }
    
    private func decreaseCount() {
        if count > 0 {
            count -= 1
            textField.text = String(count)
            appendHistory("значение изменено на -1")
        } else {
            appendHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    private func appendHistory(_ text: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        DispatchQueue.main.async {
            self.counterHistory.text += "\(timestamp): \(text)\n"
            let range = NSMakeRange(self.counterHistory.text.count - 1, 0)
            self.counterHistory.scrollRangeToVisible(range)
        }
    }
    
    @IBAction private func actionCounterButton(_ sender: Any) {
        increaseCount()
    }
    
    @IBAction private func actionReset(_ sender: Any) {
        count = 0
        textField.text = "0"
        appendHistory("значение сброшено")
    }
    
    @IBAction private func actionPlusOne(_ sender: Any) {
        increaseCount()
    }
    
    @IBAction private func actionMinusOne(_ sender: Any) {
        decreaseCount()
    }
}
