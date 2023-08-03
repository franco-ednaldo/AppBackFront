// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let walletData = try? JSONDecoder().decode(WalletData.self, from: jsonData)

import Foundation

// MARK: - WalletData
struct WalletData: Codable {
    var quotationEthereum: QuotationEthereum?
    var latestTransactionsCell: LatestTransactionsCell?

    enum CodingKeys: String, CodingKey {
        case quotationEthereum = "quotation_ethereum"
        case latestTransactionsCell = "latest_transactions_cell"
    }
}

// MARK: - LatestTransactionsCell
struct LatestTransactionsCell: Codable {
    var latestTransactionsTitle: String?
    var listOfTransactions: [ListOfTransaction]?

    enum CodingKeys: String, CodingKey {
        case latestTransactionsTitle = "latest_transactions_title"
        case listOfTransactions = "list_of_transactions"
    }
}

// MARK: - ListOfTransaction
struct ListOfTransaction: Codable {
    var type, idTransaction, image: String?
    var priceEth, valueDollar: Double?
    var dateAndHour: String?

    enum CodingKeys: String, CodingKey {
        case type
        case idTransaction = "id_transaction"
        case image
        case priceEth = "price_eth"
        case valueDollar = "value_dollar"
        case dateAndHour = "date_and_hour"
    }
}

// MARK: - QuotationEthereum
struct QuotationEthereum: Codable {
    var ethValue, valueInDollars: Double?
    var coinEthImage: String?

    enum CodingKeys: String, CodingKey {
        case ethValue = "eth_value"
        case valueInDollars = "value_in_dollars"
        case coinEthImage = "coin_eth_image"
    }
}
