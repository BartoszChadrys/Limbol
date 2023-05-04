//
//  TopicView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 03/05/2023.
//

import SwiftUI

struct TopicView: View {
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack() {
                LimboLogoWithPointsView()
                
                Text("Rozdziały")
                    .font(.custom("Montserrat", size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                ScrollView {
                    LazyVStack {
                        TopicElementView(gradient: K.greenGradient, mainColor: Color("greenColor"), topicTitle: "Operacje na danych", points: 15, circleTitle: "Gratulacje!", circleIcon: Image("checkmarkIcon"), percent: 100)
                        
                        TopicElementView(gradient: K.orangeGradient, mainColor: Color("orangeColor"), topicTitle: "Instrukcje warunkowe", points: 7, circleTitle: "Gratulacje!", circleIcon: Image("flameWhite"), percent: 47)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView()
    }
}

struct TopicCircleView: View {
    var percent: Int
    var title: String
    var gradient: LinearGradient
    var mainColor: Color
    var circleIcon: Image
    
    var body: some View {
        ZStack() {
            Circle()
                .foregroundColor(Color("backgroundColor"))
                .frame(width: 75, height: 75)
                .shadow(color: mainColor,radius: 15)
            
            Circle()
                .stroke(gradient, lineWidth: 4.5)
                .frame(width: 75, height: 75)
            
            Circle()
                .foregroundColor(mainColor)
                .frame(width: 20, height: 20)
                .padding(.bottom, 75)
            
            circleIcon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12, height: 12)
                .padding(.bottom, 75)
            
            VStack {
                Text("\(percent)%")
                    .font(.custom("Montserrat", size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.custom("Montserrat", size: 10))
                    .fontWeight(.light)
                    .foregroundColor(.white)
            }
        }
    }
}

struct TopicTitleView: View {
    var title: String
    var points: Int
    var pointsColor: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.custom("Montserrat", size: 15))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("Zdobyte punkty")
                .font(.custom("Montserrat", size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Text("\(points)/15")
                .font(.custom("Montserrat", size: 20))
                .fontWeight(.semibold)
                .foregroundColor(pointsColor)
        }
    }
}

struct TopicElementView: View {
    var gradient: LinearGradient
    var mainColor: Color
    var topicTitle: String
    var points: Int
    var circleTitle: String
    var circleIcon: Image
    var percent: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(gradient, lineWidth: 3)
                .frame(height: 120)
                .padding(.trailing, 25)
                .padding(.leading, 25)
            
            HStack(spacing: 40) {
                TopicTitleView(title: topicTitle, points: points, pointsColor: mainColor)
                
                TopicCircleView(percent: percent, title: circleTitle, gradient: gradient, mainColor: mainColor, circleIcon: circleIcon)
            }
        }
        .padding(.bottom, 15)
    }
}
