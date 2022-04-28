//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

final class Bank {
    private var queue = Queue(list: LinkedList<Client>())
    private let clerk = DispatchQueue(label: "clerk")
    
    func executeBankWork() {
        let work = DispatchWorkItem {
            self.serveClients()
        }
        receiveClients()
        clerk.sync(execute: work)
    }
    
    func receiveClients() {
        for order in 1...Int.random(in: 10...30) {
            queue.enqueue(Client(order))
        }
    }
    
    func serveClients() {
        while !queue.isEmpty {
            dealWithClient()
        }
    }
    
    func dealWithClient() {
        guard let client = queue.dequeue() else {
            return
        }
        print("\(client.orderNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(client.orderNumber)번 고객 업무 종료")
    }
}