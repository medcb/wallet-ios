import UIKit
import ThemeKit
import LanguageKit

struct RestoreModule {

    static func viewController(sourceViewController: UIViewController?, returnViewController: UIViewController? = nil) -> UIViewController {
        let mnemonicService = RestoreMnemonicService(languageManager: LanguageManager.shared)
        let mnemonicViewModel = RestoreMnemonicViewModel(service: mnemonicService)

        let privateKeyService = RestorePrivateKeyService()
        let privateKeyViewModel = RestorePrivateKeyViewModel(service: privateKeyService)

        let viewModel = RestoreViewModel(mnemonicViewModel: mnemonicViewModel, privateKeyViewModel: privateKeyViewModel)

        let viewController = RestoreViewController(
                viewModel: viewModel,
                mnemonicViewModel: mnemonicViewModel,
                privateKeyViewModel: privateKeyViewModel,
                returnViewController: returnViewController
        )

        let module = ThemeNavigationController(rootViewController: viewController)

        if App.shared.termsManager.termsAccepted {
            return module
        } else {
            return TermsModule.viewController(sourceViewController: sourceViewController, moduleToOpen: module)
        }
    }

}
