//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/3/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // background layer
                Color.theme.background
                    .ignoresSafeArea()
                
                // content layer
                VStack {
                    homeHeader
                    
                    columnTitles(geometry: geometry)
                    
                    if (!showPortfolio) {
                        allCoinsList
                            .transition(.move(edge:.leading))
                    }
                    
                    if (showPortfolio) {
                        portfolioCoinsList
                            .transition(.move(edge:.trailing))
                    }
                    
                    Spacer(minLength: 0)
                }
            }
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .transaction { transaction in
                    transaction.animation = nil
                }
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func columnTitles(geometry: GeometryProxy) -> some View {
        HStack {
            Text("Coin")
            Spacer()
            if (showPortfolio) {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: geometry.size.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(.secondaryText)
        .padding(.horizontal)
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
    .environmentObject(HomeViewModel())
}
