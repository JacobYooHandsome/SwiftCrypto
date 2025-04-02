//
//  CoinRowView.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/8/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                leftColumn
                if (showHoldingsColumn) {
                    centerColumn
                }
                rightColumn
                    .frame(width: geometry.size.width / 3.5, alignment: .trailing)
            }
            .font(.subheadline)
        }
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(.accent)
            Spacer()
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrency(minDecimalRange: 2, maxDecimalRange: 2))
                .bold()
            Text((coin.currentHoldings ?? 0).format2())
        }
        .foregroundStyle(.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(String(coin.currentPrice.asCurrency(minDecimalRange: 2, maxDecimalRange: 6)))
                .bold()
                .foregroundStyle(.accent)
            Text((coin.priceChangePercentage24H ?? 0).format2() + "%")
                .foregroundStyle(coin.priceChangePercentage24H ?? 0 >= 0 ? .green : .red)
        }
    }
}



#Preview {
    CoinRowView(coin: MockCoinData.coin, showHoldingsColumn: true)
}
