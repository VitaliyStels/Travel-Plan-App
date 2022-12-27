//
//  InfoCard.swift
//  Travel plan app
//
//  Created by Виталий on 24.12.2022.
//

import SwiftUI

struct InfoCard: View {
    var body: some View {
        ZStack {
        Rectangle()
            .fill(.green)
            .frame(width: 350, height: 100)
            .cornerRadius(30)
            
        VStack {
            Text("I hope you enjoying this app")
                .foregroundColor(.white)
                .font(.system(size: 18))
        }
        }
    }
}

struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoCard()
    }
}
