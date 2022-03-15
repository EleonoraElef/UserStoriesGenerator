//
//  GenerateButtonView.swift
//  UserStoryGenerator#2
//
//  Created by Eleonora Elefante on 12/03/22.
//

import SwiftUI

struct GenerateButtonView: View {
    var body: some View {
        
        ZStack {
            
            //Button shape and color
            RoundedRectangle(cornerRadius: 43.38)
            .fill(LinearGradient(
            gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 1, green: 0.42627450823783875, blue: 0.18039214611053467, alpha: 1)), location: 0),
            .init(color: Color(#colorLiteral(red: 1, green: 0.18039216101169586, blue: 0.4000000059604645, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: 0.21462490130515988, y: -0.12447288961581471),
            endPoint: UnitPoint(x: 0.9662868247692444, y: 0.9999996205533881)))
            .frame(width: 664.6, height: 142.8)
            
            //Button text 
                Text("Generate user story").font(.system(size: 43.4, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)

        }
    }
}

struct GenerateButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateButtonView()
    }
}
