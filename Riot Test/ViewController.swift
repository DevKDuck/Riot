//
//  ViewController.swift
//  Riot Test
//
//  Created by duck on 2024/01/08.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    func makingObservable(){
        //MARK: Observable 생성
        //1. Create 를 이용해서 Observable을 직접 구현
        Observable<Int>.create{ (observer) -> Disposable in
            observable.on(.next(0))
            observable.onNext(1)
            
            observable.onCompleted()
            
            return Disposable.create()
        }
        
        //2. From 을 이용
        //from 연산자는 파라미터로 전달한 배열에 있는 요소를 순서대로 방출하고 Completed 이벤트를 전달하는 Observable을 생성함
        Observable.from([0,1])
        
    }
    

    var p = Person(name: "경덕", year: 1995)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(p.age)
     
    }


}

class Person{
    var name: String
    var year: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.year = year
    }
    
    var age: Int {
        return 2024 - year
    }
    
}


/*
 Observerable,Sequence , Observerable Sequence
 
 - Observable은 Observer(Subscriber)에게 이벤트를 전달한다
 
 - 이때 Observable은 3가지 이벤트를 전달함
 
 Emission (방출)
 1. Observable에서 발생하는 새로운 이벤트는 Next를 이용해 구독자에게 전달됨
 이벤트에 값이 포함되어 있다면 Next와 함께 값이 전달
 
 
 Notification
    - Observable 라이프 사이클에서 마지막으로 전달됨
    - Error
        - Observable에서 에러가 발생하면 에러 이벤트가 전달됨
    - Completed
        - Observable이 정상적으로 종료되면 이벤트가 전달됨
 
 
 
 
 
 Subscribe 구독한다
 - Observer는 Observable을 감시하고 있다가 전달되는 이벤트를 처리함
 - 이때 감시하는 것을 구독한다라고 표현함
 
 
 
*/
