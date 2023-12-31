import UIKit
import RxSwift
import RxCocoa

struct SimpleActivateModule {

    static var bitcoinHodlingViewController: UIViewController {
        let service = BitcoinHodlingService(localStorage: App.shared.localStorage)
        let viewModel = SimpleActivateViewModel(service: service, config: .bitcoinHodling)
        return SimpleActivateViewController(viewModel: viewModel)
    }

    static var evmTestnetViewController: UIViewController {
        let service = TestNetActivateService(testNetManager: App.shared.testNetManager)
        let viewModel = SimpleActivateViewModel(service: service, config: .testNet)
        return SimpleActivateViewController(viewModel: viewModel)
    }

}

protocol ISimpleActivateService {
    var activated: Bool { get }
    var activatedChangedObservable: Observable<Bool> { get }

    func toggle()
}
