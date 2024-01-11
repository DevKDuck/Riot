//
//  PublishSubject.swift
//  Riot Test
//
//  Created by duck on 2024/01/10.
//

import UIKit
import RxSwift
import RxCocoa

class Psj: UIViewController{
    
    var disposeBag = DisposeBag()
    
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setLayout()
    }
    
    func setTextField(){
        textField.rx.text
            .subscribe(onNext: { changeText in
                print("Change Text:::\(changeText)")
            })
            .dispose(by: disposeBag)
    }
    
    func setLayout(){
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
