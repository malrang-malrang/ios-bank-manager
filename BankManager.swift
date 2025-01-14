//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

final class BankManager {
    private enum Text {
        static let open = "1 : 은행개점"
        static let close = "2 : 종료"
        static let input = "입력 : "
        static let empty = ""
    }
    
    private var bank: Bank
    
    init(of bank: Bank) {
        self.bank = bank
    }
    
    func taskStart() {
        showMenuMessage()
        bank.executeBankWork()
    }
    
    private func showMenuMessage() {
        print(Text.open)
        print(Text.close)
        print(Text.input)
    }
}

