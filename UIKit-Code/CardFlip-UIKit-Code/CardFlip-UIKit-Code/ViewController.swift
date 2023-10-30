import UIKit

final class ViewController: UIViewController {

    private let cardView = CardView()   // CardView를 참조

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        settingCardView()
    }

    private func settingCardView() {

        let card1 = cardView
        card1.frame = CGRect(x: 20, y: 100, width: 200, height: 300)    // carView 사이즈 조정
        card1.center = view.center // 화면 중앙에 배치
        view.addSubview(card1)  // view에 추가
    }
}
