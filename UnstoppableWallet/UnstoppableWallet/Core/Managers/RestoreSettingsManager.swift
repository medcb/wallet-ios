import CoinKit

class RestoreSettingsManager {
    private let storage: IRestoreSettingsStorage

    init(storage: IRestoreSettingsStorage) {
        self.storage = storage
    }

}

extension RestoreSettingsManager {

    func settings(account: Account, coin: Coin) -> RestoreSettings {
        let records = storage.restoreSettings(accountId: account.id, coinId: coin.id)

        var settings = RestoreSettings()

        for record in records {
            if let type = RestoreSettingType(rawValue: record.key) {
                settings[type] = record.value
            }
        }

        return settings
    }

    func save(settings: RestoreSettings, account: Account, coin: Coin) {
        let records = settings.map { type, value in
            RestoreSettingRecord(accountId: account.id, coinId: coin.id, key: type.rawValue, value: value)
        }

        storage.save(restoreSettingRecords: records)
    }

}

enum RestoreSettingType: String {
    case birthdayHeight
}

typealias RestoreSettings = [RestoreSettingType: String]

extension RestoreSettings {

    var birthdayHeight: Int? {
        self[.birthdayHeight].flatMap { Int($0) }
    }

}
