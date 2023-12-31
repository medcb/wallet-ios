import MarketKit

class BlockchainSettingsStorage {
    private let storage: BlockchainSettingRecordStorage

    private let keyEvmSyncSource = "evm-sync-source"

    init(storage: BlockchainSettingRecordStorage) {
        self.storage = storage
    }

}

extension BlockchainSettingsStorage {

    func evmSyncSourceName(blockchainType: BlockchainType) -> String? {
        try? storage.record(blockchainUid: blockchainType.uid, key: keyEvmSyncSource).flatMap { $0.value }
    }

    func save(evmSyncSourceName: String, blockchainType: BlockchainType) {
        let record = BlockchainSettingRecord(blockchainUid: blockchainType.uid, key: keyEvmSyncSource, value: evmSyncSourceName)
        try? storage.save(record: record)
    }

}
