//
//  StatisticsCard.swift
//  Travel plan app
//
//  Created by Виталий on 30.12.2022.
//

import SwiftUI

struct StatisticsCard: View {
    var countOfTrips : Int
    
//    var totalSpendings : Int
    let cardWidth : CGFloat = 350
    let cardHeight : CGFloat = 160
    var body: some View {
        ZStack {
        Rectangle()
            .fill(.green)
            .frame(width: cardWidth, height: cardHeight)
            .cornerRadius(30)
            
            VStack {
                Spacer()
            Text("You had \(countOfTrips) trips")
                    .fontWeight(.medium)
                .foregroundColor(.white)
                .font(.system(size: 22))
                .padding()
                
                    VStack(alignment: .leading) {
                        CommonText(commonTextsText: "Detailed statistic coming soon")
                            .opacity(0.9)
                        CommonText(commonTextsText: "You was in: $$$")
                            .opacity(0.7)
                        CommonText(commonTextsText: "Total spended : $$")
                            .opacity(0.5)
                    }
            
        }
        }
        .frame(width: cardWidth, height: cardHeight)
    }
}

struct StatisticsCard_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsCard(countOfTrips: 3)
    }
}
