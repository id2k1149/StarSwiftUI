//
//  ContentView.swift
//  StarSwiftUI
//
//  Created by Max Franz Immelmann on 4/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300)
            Star()
                .fill(Color.orange)
                .frame(width: 250)
            // 6 points degrees(-30)
                .rotationEffect(.degrees(54))
        }
    }
}

struct Star: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        
        let starPoints = calculateStarPoints(center: center,
                                             radius: radius,
                                             numberOfPoints: 5)
        
        path.addLines(starPoints)
        path.closeSubpath()
        
        return path
    }
    
    private func calculateStarPoints(center: CGPoint,
                                     radius: CGFloat,
                                     numberOfPoints: Int) -> [CGPoint] {
        let angle = CGFloat.pi * 2 / CGFloat(numberOfPoints * 2)
        var points = [CGPoint]()
        
        for i in 0..<numberOfPoints*2 {
            let isEven = i % 2 == 0
            let r = isEven ? radius : radius * 0.4
            let a = angle * CGFloat(i)
            let x = center.x + r * cos(a)
            let y = center.y + r * sin(a)
            points.append(CGPoint(x: x, y: y))
        }
        
        return points
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
