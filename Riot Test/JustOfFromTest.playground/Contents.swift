import UIKit
import RxSwift

let disposeBag = DisposeBag()

let element = "💙"
//항목을 그대로 전달 Just, of

//MARK: Just 연산자 - 한가지만
Observable.just(element)
    .subscribe{event in print (event)}
    .disposed(by: disposeBag)
//문자열을 방출하는 옵저버블

Observable.just([1,2,3])
    .subscribe{event in print (event)}
    .disposed(by: disposeBag)

//파라미터로 전달한 요소를 그대로 방출함

//MARK: Of 연산자 - 2가지 이상
let a = "a"
let b = "b"
let c = "c"

Observable.of(a,b,c)
    .subscribe{ele in print (ele)}
    .disposed(by: disposeBag)

Observable.of([1,2,3],[4,5,6],[7,8,9])
    .subscribe{ele in print (ele)}
    .disposed(by: disposeBag)

//배열에 포함되어 있는 요소를 하나씩 방출하고 싶을때

Observable.from([1,2,3]) - 배열에서 한나씩
    .subscribe{ele in print (ele)}
    .disposed(by: disposeBag)

