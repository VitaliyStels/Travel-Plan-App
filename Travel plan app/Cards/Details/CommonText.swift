//
//  CommonText.swift
//  Travel plan app
//
//  Created by Виталий on 30.12.2022.
//

import SwiftUI

struct CommonText: View {
    var commonTextsText : String
    var body: some View {
        ZStack {
            Text("\(commonTextsText)")
                .foregroundColor(.white)
            .font(.system(size: 18))
        }.padding(.bottom, 7)
    }
}

struct CommonText_Previews: PreviewProvider {
    static var previews: some View {
        CommonText(commonTextsText: "Test")
    }
}
