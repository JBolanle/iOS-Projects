//
//  ContentView.swift
//  Drawing
//
//  Created by Jumoke Bolanle on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding([.horizontal])
        }
    }
    
    
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            
            return path
        }
    }
    
    struct Arc: InsettableShape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        var insetAmount = 0.0
        
        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment
            
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
            
            return path
        }
        
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            return arc
        }
    }
    
    struct Flower: Shape {
        // how much to move the petal away from the center
        var petalOffset: Double = -20
        
        // how wide to make each petal
        var petalWidth: Double = 100
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            // count from 0 to pi * 2, moving up pi for 1/8 each time
            for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
                // rotate the petal by the current value of the loop
                let rotation  = CGAffineTransform(rotationAngle: number)
                
                // center the petal in view
                let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
                
                // creating the path for the petal using the values created
                let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
                
                // rotational + position transformation
                let rotatedPetal = originalPetal.applying(position)
                
                // adding to main path \Path()\
                path.addPath(rotatedPetal)
            }
            
            return path
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
