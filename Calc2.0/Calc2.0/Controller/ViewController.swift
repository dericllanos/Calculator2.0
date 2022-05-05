//
//  ViewController.swift
//  Calc2.0
//
//  Created by Frederic Rey Llanos on 04/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var ResultView: UIView = {
        let resultView = UIView(frame: .zero)
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.backgroundColor = .darkGray
        resultView.layer.borderColor = UIColor.black.cgColor
        resultView.layer.borderWidth = 2
        return resultView
    }()
    
    private lazy var StackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black
        
        return stackView
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Arial", size: 60)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.overrideUserInterfaceStyle = .light
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupButtons()
    }
    
    private func setupButtons() {
        let buttonSize: CGFloat = self.view.frame.size.width / 4
        
        let zeroButton = UIButton(frame: CGRect(x: 0, y: self.StackView.frame.size.height - (buttonSize * 1.21), width: buttonSize * 2, height: buttonSize * 1.21))
        zeroButton.layer.borderColor = UIColor.black.cgColor
        zeroButton.layer.borderWidth = 2
        zeroButton.setTitleColor(.white, for: .normal)
        zeroButton.backgroundColor = .gray
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.StackView.addSubview(zeroButton)
        
        let decimalButton = UIButton(frame: CGRect(x: buttonSize * CGFloat(2), y: self.StackView.frame.size.height - (buttonSize * 1.21), width: buttonSize, height: buttonSize * 1.21))
        decimalButton.layer.borderColor = UIColor.black.cgColor
        decimalButton.layer.borderWidth = 2
        decimalButton.setTitleColor(.white, for: .normal)
        decimalButton.backgroundColor = .gray
        decimalButton.setTitle(".", for: .normal)
        decimalButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        self.StackView.addSubview(decimalButton)
        
        for i in 0..<3 {
            let row1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(i), y: self.StackView.frame.size.height - (buttonSize * 2.42), width: buttonSize, height: buttonSize * 1.21))
            row1.layer.borderColor = UIColor.black.cgColor
            row1.layer.borderWidth = 2
            row1.setTitleColor(.white, for: .normal)
            row1.backgroundColor = .gray
            row1.setTitle("\(i + 1)", for: .normal)
            row1.titleLabel?.font = .boldSystemFont(ofSize: 20)
            self.StackView.addSubview(row1)
        }
        
        for i in 0..<3 {
            let row2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(i), y: self.StackView.frame.size.height - (buttonSize * 3.63), width: buttonSize, height: buttonSize * 1.21))
            row2.layer.borderColor = UIColor.black.cgColor
            row2.layer.borderWidth = 2
            row2.setTitleColor(.white, for: .normal)
            row2.backgroundColor = .gray
            row2.setTitle("\(i + 4)", for: .normal)
            row2.titleLabel?.font = .boldSystemFont(ofSize: 20)
            self.StackView.addSubview(row2)
        }
        
        for i in 0..<3 {
            let row3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(i), y: self.StackView.frame.size.height - (buttonSize * 4.84), width: buttonSize, height: buttonSize * 1.21))
            row3.layer.borderColor = UIColor.black.cgColor
            row3.layer.borderWidth = 2
            row3.setTitleColor(.white, for: .normal)
            row3.backgroundColor = .gray
            row3.setTitle("\(i + 7)", for: .normal)
            row3.titleLabel?.font = .boldSystemFont(ofSize: 20)
            self.StackView.addSubview(row3)
        }
        
        let top = ["A/C", "+/-", "%"]
        
        for i in 0..<3 {
            let row4 = UIButton(frame: CGRect(x: buttonSize * CGFloat(i), y: self.StackView.frame.size.height - (buttonSize * 6.05), width: buttonSize, height: buttonSize * 1.21))
            row4.layer.borderColor = UIColor.black.cgColor
            row4.layer.borderWidth = 2
            row4.setTitleColor(.white, for: .normal)
            row4.backgroundColor = .darkGray
            row4.setTitle("\(top[i])", for: .normal)
            row4.titleLabel?.font = .boldSystemFont(ofSize: 20)
            self.StackView.addSubview(row4)
        }
        
        let divide = UIButton(frame: CGRect(x: buttonSize * CGFloat(3), y: self.StackView.frame.size.height - (buttonSize * 6.05), width: buttonSize, height: buttonSize * 1.21))
        divide.layer.borderColor = UIColor.black.cgColor
        divide.layer.borderWidth = 2
        divide.setTitleColor(.white, for: .normal)
        divide.backgroundColor = .systemOrange
        divide.setTitle("/", for: .normal)
        divide.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.StackView.addSubview(divide)

        let multiply = UIButton(frame: CGRect(x: buttonSize * CGFloat(3), y: self.StackView.frame.size.height - (buttonSize * 4.84), width: buttonSize, height: buttonSize * 1.21))
        multiply.layer.borderColor = UIColor.black.cgColor
        multiply.layer.borderWidth = 2
        multiply.setTitleColor(.white, for: .normal)
        multiply.backgroundColor = .systemOrange
        multiply.setTitle("*", for: .normal)
        multiply.titleLabel?.font = .boldSystemFont(ofSize: 30)
        self.StackView.addSubview(multiply)
        
        let subtract = UIButton(frame: CGRect(x: buttonSize * CGFloat(3), y: self.StackView.frame.size.height - (buttonSize * 3.63), width: buttonSize, height: buttonSize * 1.21))
        subtract.layer.borderColor = UIColor.black.cgColor
        subtract.layer.borderWidth = 2
        subtract.setTitleColor(.white, for: .normal)
        subtract.backgroundColor = .systemOrange
        subtract.setTitle("-", for: .normal)
        subtract.titleLabel?.font = .boldSystemFont(ofSize: 30)
        self.StackView.addSubview(subtract)
        
        let add = UIButton(frame: CGRect(x: buttonSize * CGFloat(3), y: self.StackView.frame.size.height - (buttonSize * 2.42), width: buttonSize, height: buttonSize * 1.21))
        add.layer.borderColor = UIColor.black.cgColor
        add.layer.borderWidth = 2
        add.setTitleColor(.white, for: .normal)
        add.backgroundColor = .systemOrange
        add.setTitle("+", for: .normal)
        add.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.StackView.addSubview(add)
        
        let equals = UIButton(frame: CGRect(x: buttonSize * CGFloat(3), y: self.StackView.frame.size.height - (buttonSize * 1.21), width: buttonSize, height: buttonSize * 1.21))
        equals.layer.borderColor = UIColor.black.cgColor
        equals.layer.borderWidth = 2
        equals.setTitleColor(.white, for: .normal)
        equals.backgroundColor = .systemOrange
        equals.setTitle("=", for: .normal)
        equals.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.StackView.addSubview(equals)
        
        resultLabel.frame = CGRect(x: 20, y: self.ResultView.frame.height / 20, width: self.ResultView.frame.width - 40, height: self.ResultView.frame.height)
        self.view.addSubview(self.resultLabel)
    }
    
    private func setupUI() {
        self.view.addSubview(self.ResultView)
        self.view.addSubview(self.StackView)
        
        self.ResultView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.ResultView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        self.ResultView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        self.ResultView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height * 0.3).isActive = true
        
        self.StackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        self.StackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        self.StackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        self.StackView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height * 0.701).isActive = true
    }
}

