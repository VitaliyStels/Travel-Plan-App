//
//  TripTotals.swift
//  Travel plan app
//
//  Created by Виталий on 30.12.2022.
//

import SwiftUI

struct TripTotals: View {
    var tripCurrency : String
    var tripTotals : Int
    var body: some View {
        ZStack {
            HStack {
                
                VStack {
                    Spacer()
                    
                    
                    HStack {
                        Text("Total: \(tripCurrency)\(tripTotals)")
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        
                    }.padding()
                        .padding(.bottom, 30)
                    
                }
                Spacer()
            }
        }.frame(width: 300, height: 400)
    }
}

struct TripTotals_Previews: PreviewProvider {
    static var previews: some View {
        TripTotals(tripCurrency: "€", tripTotals: 0)
    }
}
