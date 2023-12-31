import BitcoinCashKit
import BitcoinCore
import RxSwift
import MarketKit
import HdWalletKit

class BitcoinCashAdapter: BitcoinBaseAdapter {
    private let bitcoinCashKit: BitcoinCashKit.Kit

    init(wallet: Wallet) throws {
        guard let bitcoinCashCoinType = wallet.coinSettings.bitcoinCashCoinType else {
            throw AdapterError.wrongParameters
        }

        let kitCoinType: BitcoinCashKit.CoinType

        switch bitcoinCashCoinType {
        case .type0: kitCoinType = .type0
        case .type145: kitCoinType = .type145
        }

        let networkType: BitcoinCashKit.Kit.NetworkType = .mainNet(coinType: kitCoinType)
        let logger = App.shared.logger.scoped(with: "BitcoinCashKit")

        guard let syncMode = Self.syncMode(account: wallet.account, restoreSource: wallet.coinSettings.restoreSource) else {
            throw AdapterError.wrongParameters
        }

        switch wallet.account.type {
        case .mnemonic:
            guard let seed = wallet.account.type.mnemonicSeed else {
                throw AdapterError.unsupportedAccount
            }

            bitcoinCashKit = try BitcoinCashKit.Kit(
                    seed: seed,
                    walletId: wallet.account.id,
                    syncMode: syncMode,
                    networkType: networkType,
                    confirmationsThreshold: BitcoinBaseAdapter.confirmationsThreshold,
                    logger: logger
            )
        case let .hdExtendedKey(key):
            bitcoinCashKit = try BitcoinCashKit.Kit(
                    extendedKey: key,
                    walletId: wallet.account.id,
                    syncMode: syncMode,
                    networkType: networkType,
                    confirmationsThreshold: BitcoinBaseAdapter.confirmationsThreshold,
                    logger: logger
            )
        default:
            throw AdapterError.unsupportedAccount
        }

        super.init(abstractKit: bitcoinCashKit, wallet: wallet)

        bitcoinCashKit.delegate = self
    }

    override var explorerTitle: String {
        "btc.com"
    }

    override func explorerUrl(transactionHash: String) -> String? {
        "https://bch.btc.com/" + transactionHash
    }

}

extension BitcoinCashAdapter: ISendBitcoinAdapter {

    var blockchainType: BlockchainType {
        .bitcoinCash
    }

}

extension BitcoinCashAdapter {

    static func clear(except excludedWalletIds: [String]) throws {
        try Kit.clear(exceptFor: excludedWalletIds)
    }

}
