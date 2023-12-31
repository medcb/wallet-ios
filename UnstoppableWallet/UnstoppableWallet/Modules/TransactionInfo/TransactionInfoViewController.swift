import UIKit
import ActionSheet
import ThemeKit
import SectionsTableView
import CurrencyKit
import ComponentKit
import RxSwift
import SafariServices

class TransactionInfoViewController: ThemeViewController {
    private let disposeBag = DisposeBag()

    private let viewModel: TransactionInfoViewModel
    private let pageTitle: String
    private var urlManager: UrlManager
    private let adapter: ITransactionsAdapter

    private var viewItems = [[TransactionInfoModule.ViewItem]]()

    private let tableView = SectionsTableView(style: .grouped)

    init(adapter: ITransactionsAdapter, viewModel: TransactionInfoViewModel, pageTitle: String, urlManager: UrlManager) {
        self.adapter = adapter
        self.viewModel = viewModel
        self.pageTitle = pageTitle
        self.urlManager = urlManager

        viewItems = viewModel.viewItems

        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = pageTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "button.close".localized, style: .plain, target: self, action: #selector(onTapCloseButton))

        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

        tableView.sectionDataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear

        subscribe(disposeBag, viewModel.viewItemsDriver) { [weak self] viewItems in
            self?.viewItems = viewItems
            self?.tableView.reload()
        }

        tableView.reload()
    }

    @objc private func onTapCloseButton() {
        dismiss(animated: true)
    }

    private func openStatusInfo() {
        present(InfoModule.transactionStatusInfo, animated: true)
    }

    private func openResend(action: TransactionInfoModule.Option) {
        do {
            let viewController = try SendEvmConfirmationModule.resendViewController(adapter: adapter, action: action, transactionHash: viewModel.transactionHash)
            present(ThemeNavigationController(rootViewController: viewController), animated: true)
        } catch {
            HudHelper.instance.show(banner: .error(string: error.localizedDescription))
        }
    }

    private func openNftAsset(providerCollectionUid: String, nftUid: NftUid) {
        let module = NftAssetModule.viewController(providerCollectionUid: providerCollectionUid, nftUid: nftUid)
        present(ThemeNavigationController(rootViewController: module), animated: true)
    }

    private func statusRow(rowInfo: RowInfo, status: TransactionStatus) -> RowProtocol {
        let hash: String
        var hasButton = true
        var value: String
        var icon: UIImage?
        var spinnerProgress: Double?

        switch status {
        case .pending:
            hash = "pending"
            value = "transactions.pending".localized
            spinnerProgress = 0.2
        case .processing(let progress):
            hash = "processing-\(progress)"
            value = "transactions.processing".localized
            spinnerProgress = progress * 0.8 + 0.2
        case .completed:
            hash = "completed"
            hasButton = false
            value = "transactions.completed".localized
            icon = UIImage(named: "check_1_20")?.withTintColor(.themeRemus)
        case .failed:
            hash = "failed"
            value = "transactions.failed".localized
            icon = UIImage(named: "warning_2_20")?.withTintColor(.themeLucian)
        }

        return CellBuilderNew.row(
                rootElement: .hStack([
                    .transparentIconButton { [weak self] (component: TransparentIconButtonComponent) -> () in
                        if hasButton {
                            component.isHidden = false
                            component.button.isSelected = true
                            component.button.set(image: UIImage(named: "circle_information_24"))
                            component.onTap = {
                                self?.openStatusInfo()
                            }
                        } else {
                            component.isHidden = true
                        }
                    },
                    .margin4,
                    .textElement(text: .subhead2("status".localized)),
                    .textElement(text: .subhead1(value)),
                    .margin8,
                    .imageElement(image: .local(icon), size: .image20),
                    .determiniteSpinner20 { (component: DeterminiteSpinnerComponent) -> () in
                        if let progress = spinnerProgress {
                            component.isHidden = false
                            component.set(progress: progress)
                        } else {
                            component.isHidden = true
                        }
                    }
                ]),
                layoutMargins: UIEdgeInsets(top: 0, left: hasButton ? .margin4 : CellBuilderNew.defaultMargin, bottom: 0, right: CellBuilderNew.defaultMargin),
                tableView: tableView,
                id: "status",
                hash: hash,
                height: .heightCell48,
                bind: { cell in
                    cell.set(backgroundStyle: .lawrence, isFirst: rowInfo.isFirst, isLast: rowInfo.isLast)
                }
        )
    }

    private func optionsRow(rowInfo: RowInfo, viewItems: [TransactionInfoModule.OptionViewItem]) -> RowProtocol {
        var elements: [CellBuilderNew.CellElement] = [.textElement(text: .subhead2("tx_info.options".localized))]

        for (index, viewItem) in viewItems.enumerated() {
            elements.append(.secondaryButton { (component: SecondaryButtonComponent) -> () in
                component.button.set(style: .default)
                component.button.setTitle(viewItem.title, for: .normal)
                component.button.isEnabled = viewItem.active
                component.onTap = { [weak self] in
                    self?.openResend(action: viewItem.option)
                }
            })
            if index < viewItems.count - 1 {
                elements.append(.margin8)
            }
        }

        return CellBuilderNew.row(
                rootElement: .hStack(elements),
                tableView: tableView,
                id: "options",
                height: .heightCell48,
                bind: { cell in
                    cell.set(backgroundStyle: .lawrence, isFirst: rowInfo.isFirst, isLast: rowInfo.isLast)
                }
        )
    }

    private func fromRow(rowInfo: RowInfo, value: String, valueTitle: String?) -> RowProtocol {
        CellComponent.fromToRow(tableView: tableView, rowInfo: rowInfo, title: "tx_info.from_hash".localized, value: value, valueTitle: valueTitle)
    }

    private func toRow(rowInfo: RowInfo, value: String, valueTitle: String?) -> RowProtocol {
        CellComponent.fromToRow(tableView: tableView, rowInfo: rowInfo, title: "tx_info.to_hash".localized, value: value, valueTitle: valueTitle)
    }

    private func spenderRow(rowInfo: RowInfo, value: String, valueTitle: String?) -> RowProtocol {
        CellComponent.fromToRow(tableView: tableView, rowInfo: rowInfo, title: "tx_info.spender".localized, value: value, valueTitle: valueTitle)
    }

    private func recipientRow(rowInfo: RowInfo, value: String, valueTitle: String?) -> RowProtocol {
        CellComponent.fromToRow(tableView: tableView, rowInfo: rowInfo, title: "tx_info.recipient_hash".localized, value: value, valueTitle: valueTitle)
    }

    private func idRow(rowInfo: RowInfo, value: String) -> RowProtocol {
        CellBuilderNew.row(
                rootElement: .hStack([
                    .textElement(text: .subhead2("tx_info.transaction_id".localized)),
                    .secondaryButton { (component: SecondaryButtonComponent) -> () in
                        component.button.set(style: .default)
                        component.button.setTitle(value.shortened, for: .normal)
                        component.button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                        component.onTap = {
                            CopyHelper.copyAndNotify(value: value)
                        }
                    },
                    .secondaryCircleButton { [weak self] (component: SecondaryCircleButtonComponent) -> () in
                        component.button.set(image: UIImage(named: "share_1_20"))
                        component.onTap = {
                            let activityViewController = UIActivityViewController(activityItems: [value], applicationActivities: [])
                            self?.present(activityViewController, animated: true)
                        }
                    }
                ]),
                tableView: tableView,
                id: "transaction_id",
                hash: value,
                height: .heightCell48,
                bind: { cell in
                    cell.set(backgroundStyle: .lawrence, isFirst: rowInfo.isFirst, isLast: rowInfo.isLast)
                }
        )
    }

    private func multiLineValueRow(rowInfo: RowInfo, id: String, title: String, value: String) -> RowProtocol {
        let backgroundStyle: BaseThemeCell.BackgroundStyle = .lawrence
        let titleFont: UIFont = .subhead2
        let valueFont: UIFont = .subhead1I

        return CellBuilderNew.row(
                rootElement: .hStack([
                    .text { (component: TextComponent) -> () in
                        component.font = titleFont
                        component.textColor = .themeGray
                        component.text = title
                        component.setContentCompressionResistancePriority(.required, for: .horizontal)
                    },
                    .text { (component: TextComponent) -> () in
                        component.font = valueFont
                        component.textColor = .themeLeah
                        component.text = value
                        component.textAlignment = .right
                        component.numberOfLines = 0
                    }
                ]),
                tableView: tableView,
                id: id,
                dynamicHeight: { containerWidth in
                    CellBuilderNew.height(
                            containerWidth: containerWidth,
                            backgroundStyle: backgroundStyle,
                            text: value,
                            font: valueFont,
                            elements: [.fixed(width: TextComponent.width(font: titleFont, text: title)), .multiline]
                    )
                },
                bind: { cell in
                    cell.set(backgroundStyle: backgroundStyle, isFirst: rowInfo.isFirst, isLast: rowInfo.isLast)
                }
        )
    }

    private func warningRow(rowInfo: RowInfo, id: String, image: UIImage?, text: String, onTap: @escaping () -> ()) -> RowProtocol {
        let backgroundStyle: BaseThemeCell.BackgroundStyle = .lawrence
        let textFont: UIFont = .subhead2

        return CellBuilderNew.row(
                rootElement: .hStack([
                    .image24 { (component: ImageComponent) -> () in
                        component.imageView.image = image?.withTintColor(.themeGray)
                    },
                    .text { (component: TextComponent) -> () in
                        component.font = textFont
                        component.textColor = .themeGray
                        component.text = text
                        component.numberOfLines = 0
                    },
                    .image20 { (component: ImageComponent) -> () in
                        component.imageView.image = UIImage(named: "circle_information_20")?.withTintColor(.themeGray)
                    }
                ]),
                tableView: tableView,
                id: id,
                autoDeselect: true,
                dynamicHeight: { containerWidth in
                    CellBuilderNew.height(
                            containerWidth: containerWidth,
                            backgroundStyle: backgroundStyle,
                            text: text,
                            font: textFont,
                            elements: [.fixed(width: .iconSize20), .multiline, .fixed(width: .iconSize20)]
                    )
                },
                bind: { cell in
                    cell.set(backgroundStyle: backgroundStyle, isFirst: rowInfo.isFirst, isLast: rowInfo.isLast)
                },
                action: {
                    onTap()
                }
        )
    }

    private func doubleSpendRow(rowInfo: RowInfo, txHash: String, conflictingTxHash: String) -> RowProtocol {
        warningRow(
                rowInfo: rowInfo,
                id: "double_spend",
                image: UIImage(named: "double_send_24"),
                text: "tx_info.double_spent_note".localized
        ) { [weak self] in
            let viewController = DoubleSpendInfoViewController(transactionHash: txHash, conflictingTransactionHash: conflictingTxHash)
            self?.present(ThemeNavigationController(rootViewController: viewController), animated: true)
        }
    }

    private func lockInfoRow(rowInfo: RowInfo, lockState: TransactionLockState) -> RowProtocol {
        let id = "lock_info"
        let image = UIImage(named: lockState.locked ? "lock_24" : "unlock_24")
        let formattedDate = DateHelper.instance.formatFullTime(from: lockState.date)

        if lockState.locked {
            return warningRow(rowInfo: rowInfo, id: id, image: image, text: "tx_info.locked_until".localized(formattedDate)) { [weak self] in
                self?.present(InfoModule.timeLockInfo, animated: true)
            }
        } else {
            return noteRow(rowInfo: rowInfo, id: id, image: image, text: "tx_info.unlocked_at".localized(formattedDate))
        }
    }

    private func noteRow(rowInfo: RowInfo, id: String, image: UIImage?, text: String) -> RowProtocol {
        let backgroundStyle: BaseThemeCell.BackgroundStyle = .lawrence
        let textFont: UIFont = .subhead2

        return CellBuilderNew.row(
                rootElement: .hStack([
                    .image24 { (component: ImageComponent) -> () in
                        component.imageView.image = image?.withTintColor(.themeGray)
                    },
                    .text { (component: TextComponent) -> () in
                        component.font = textFont
                        component.textColor = .themeGray
                        component.text = text
                        component.numberOfLines = 0
                    }
                ]),
                tableView: tableView,
                id: id,
                dynamicHeight: { containerWidth in
                    CellBuilderNew.height(
                            containerWidth: containerWidth,
                            backgroundStyle: backgroundStyle,
                            text: text,
                            font: textFont,
                            elements: [.fixed(width: .iconSize20), .multiline]
                    )
                },
                bind: { cell in
                    cell.set(backgroundStyle: backgroundStyle, isFirst: rowInfo.isFirst, isLast: rowInfo.isLast)
                }
        )
    }

    private func sentToSelfRow(rowInfo: RowInfo) -> RowProtocol {
        noteRow(
                rowInfo: rowInfo,
                id: "sent_to_self",
                image: UIImage(named: "arrow_return_24"),
                text: "tx_info.to_self_note".localized
        )
    }

    private func rawTransactionRow(rowInfo: RowInfo) -> RowProtocol {
        CellBuilderNew.row(
                rootElement: .hStack([
                    .textElement(text: .subhead2("tx_info.raw_transaction".localized)),
                    .secondaryCircleButton { [weak self] (component: SecondaryCircleButtonComponent) -> () in
                        component.button.set(image: UIImage(named: "copy_20"))
                        component.onTap = {
                            if let value = self?.viewModel.rawTransaction {
                                CopyHelper.copyAndNotify(value: value)
                            }
                        }
                    }
                ]),
                tableView: tableView,
                id: "raw_transaction",
                height: .heightCell48,
                bind: { cell in
                    cell.set(backgroundStyle: .lawrence, isFirst: rowInfo.isFirst, isLast: rowInfo.isLast)
                }
        )
    }

    private func explorerRow(rowInfo: RowInfo, title: String, url: String?) -> RowProtocol {
        tableView.universalRow48(
                id: "explorer",
                image: .local(UIImage(named: "globe_24")?.withTintColor(.themeGray)),
                title: .body(title),
                accessoryType: .disclosure,
                autoDeselect: true,
                isFirst: rowInfo.isFirst,
                isLast: rowInfo.isLast,
                action: { [weak self] in
                    if let url = url {
                        self?.urlManager.open(url: url, from: self)
                    }
                }
        )
    }

    private func row(viewItem: TransactionInfoModule.ViewItem, rowInfo: RowInfo) -> RowProtocol {
        switch viewItem {
        case let .actionTitle(iconName, iconDimmed, title, subTitle):
            return CellComponent.actionTitleRow(tableView: tableView, rowInfo: rowInfo, iconName: iconName, iconDimmed: iconDimmed, title: title, value: subTitle ?? "")
        case let .amount(iconUrl, iconPlaceholderImageName, coinAmount, currencyAmount, type):
            return CellComponent.amountRow(tableView: tableView, rowInfo: rowInfo, iconUrl: iconUrl, iconPlaceholderImageName: iconPlaceholderImageName, coinAmount: coinAmount, currencyAmount: currencyAmount, type: type)
        case let .nftAmount(iconUrl, iconPlaceholderImageName, nftAmount, type, providerCollectionUid, nftUid):
            var onTapOpenNft: (() -> ())?

            if let providerCollectionUid = providerCollectionUid, let nftUid = nftUid {
                onTapOpenNft = { [weak self] in
                    self?.openNftAsset(providerCollectionUid: providerCollectionUid, nftUid: nftUid)
                }
            }

            return CellComponent.nftAmountRow(tableView: tableView, rowInfo: rowInfo, iconUrl: iconUrl, iconPlaceholderImageName: iconPlaceholderImageName, nftAmount: nftAmount, type: type, onTapOpenNft: onTapOpenNft)
        case let .status(status):
            return statusRow(rowInfo: rowInfo, status: status)
        case let .options(actions: viewItems):
            return optionsRow(rowInfo: rowInfo, viewItems: viewItems)
        case let .date(date):
            return CellComponent.valueRow(tableView: tableView, rowInfo: rowInfo, iconName: nil, title: "tx_info.date".localized, value: DateHelper.instance.formatFullTime(from: date))
        case let .from(value, valueTitle):
            return fromRow(rowInfo: rowInfo, value: value, valueTitle: valueTitle)
        case let .to(value, valueTitle):
            return toRow(rowInfo: rowInfo, value: value, valueTitle: valueTitle)
        case let .spender(value, valueTitle):
            return spenderRow(rowInfo: rowInfo, value: value, valueTitle: valueTitle)
        case let .recipient(value, valueTitle):
            return recipientRow(rowInfo: rowInfo, value: value, valueTitle: valueTitle)
        case let .id(value):
            return idRow(rowInfo: rowInfo, value: value)
        case let .rate(value):
            return CellComponent.valueRow(tableView: tableView, rowInfo: rowInfo, iconName: nil, title: "tx_info.rate".localized, value: value)
        case let .fee(title, value):
            return CellComponent.valueRow(tableView: tableView, rowInfo: rowInfo, iconName: nil, title: title, value: value)
        case let .price(price):
            return CellComponent.valueRow(tableView: tableView, rowInfo: rowInfo, iconName: nil, title: "tx_info.price".localized, value: price)
        case let .doubleSpend(txHash, conflictingTxHash):
            return doubleSpendRow(rowInfo: rowInfo, txHash: txHash, conflictingTxHash: conflictingTxHash)
        case let .lockInfo(lockState):
            return lockInfoRow(rowInfo: rowInfo, lockState: lockState)
        case .sentToSelf:
            return sentToSelfRow(rowInfo: rowInfo)
        case .rawTransaction:
            return rawTransactionRow(rowInfo: rowInfo)
        case let .memo(value):
            return multiLineValueRow(rowInfo: rowInfo, id: "memo", title: "tx_info.memo".localized, value: value)
        case let .service(value):
            return CellComponent.valueRow(tableView: tableView, rowInfo: rowInfo, iconName: nil, title: "tx_info.service".localized, value: value)
        case let .explorer(title, url):
            return explorerRow(rowInfo: rowInfo, title: title, url: url)
        }
    }

}

extension TransactionInfoViewController: SectionsDataSource {

    func buildSections() -> [SectionProtocol] {
        viewItems.enumerated().map { (index: Int, sectionViewItems: [TransactionInfoModule.ViewItem]) -> SectionProtocol in
            Section(
                    id: "section_\(index)",
                    headerState: .margin(height: .margin12),
                    footerState: .margin(height: index == viewItems.count - 1 ? .margin32 : 0),
                    rows: sectionViewItems.enumerated().map { (index, viewItem) in
                        row(viewItem: viewItem, rowInfo: RowInfo(index: index, isFirst: index == 0, isLast: index == sectionViewItems.count - 1))
                    }
            )
        }
    }

}
