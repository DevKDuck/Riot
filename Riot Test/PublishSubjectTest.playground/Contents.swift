import Foundation
import RxSwift


//MARK: PublishSubject

//Subject로 전달되는 이벤트를 Observer에게 전달하는 가장 기본적인 형태의 Subject


//문자열이 포함된 Next 이벤트를 받아서 다른 Observer에게 전달할 수 있음
//생성자를 호출할때에는 파라미터를 전달하지 않는다
//Subject는 Observable이면서 Observer이다.
//다른 소스로부터이벤트를 전달받을 수 있고, 다른 옵저버로 이벤트를 전달할 수 있다.


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

let o2 = subject.subscribe{
    print(">>2",$0)
}
o2.disposed(by: disposeBag)
subject.onNext("Subject")

//모든 구독자에게 completed이벤트가 전달됨
subject.onCompleted()

//모든 구독자와 새로운 구독자에게 에러 이벤트 전달되는 경우
subject.onError(Myerror.error)


let o3 = subject.subscribe{
    print(">>3",$0)
}

//PublishSubject 특징
//이벤트가 전달되면 즉시 구독자에게 전달함
//Subject가 최초로 생성되는 시점과 첫번째 구독이 시작되는 시점 사이에 전달되는 이벤트는 그냥사라짐

