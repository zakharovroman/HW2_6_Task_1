//
//  ViewController.swift
//  HW 2
//
//  Created by Alexey Efimov on 12.06.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        changeColor()
        rgbValueForLabel()
        rgbValueForTextField()
        
    }

    // Цвет вью
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    // Значения RGB
    func rgbValueForLabel() {
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    func rgbValueForTextField() {
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    // Изменение цветов слайдерами
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        changeColor()
        rgbValueForLabel()
        rgbValueForTextField()
    }
}

extension ViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру нажатием на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        var value = redTextField.text!
        
        if let number = Float(value) {
            redSlider.value = number
            changeColor()
            rgbValueForLabel()
        }
        
        value = greenTextField.text!
        
        if let number = Float(value) {
            greenSlider.value = number
            changeColor()
            rgbValueForLabel()
        }
        
        value = blueTextField.text!
        
        if let number = Float(value) {
            blueSlider.value = number
            changeColor()
            rgbValueForLabel()
        }
    }
}
