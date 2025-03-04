//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/8/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(MockCoinData.coin)
            self.portfolioCoins.append(MockCoinData.coin)
        }
    }
    
    func addSubscribers() {
        data
    }
    
}
