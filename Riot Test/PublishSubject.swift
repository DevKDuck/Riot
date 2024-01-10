//
//  PublishSubject.swift
//  Riot Test
//
//  Created by duck on 2024/01/10.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: PublishSubject

//Subject로 전달되는 이벤트를 Observer에게 전달하는 가장 기본적인 형태의 Subject


//문자열이 포함된 Next 이벤트를 받아서 다른 Observer에게 전달할 수 있음
//생성자를 호출할때에는 파라미터를 전달하지 않는다
//Subject는 Observable이면서 Observer이다.
//다른 소스로부터이벤트를 전달받을 수 있고, 다른 옵저버로 이벤트를 전달할 수 있다.
class Psj: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        testPublishSubject()
    }
    
    func testPublishSubject(){
        let disposeBag = DisposeBag()

        enum Myerror: Error{
            case error
        }
        //구독이후에 전달되는 새로운 이벤트만 구독자로 전달
        let subject = PublishSubject<String>()

        //그래서 이게 전달이 안되는거임
        subject.onNext("Hello")

        let o1 = subject.subscribe{ print(">>1", $0)}
        o1.disposed(by: disposeBag)

        subject.onNext("RxSwift")

    }
}
