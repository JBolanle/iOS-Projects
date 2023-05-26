//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Jumoke Bolanle on 5/26/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Hello, World!")
    }
    
    struct CheckoutView_Previews: PreviewProvider {
        static var previews: some View {
            CheckoutView(order: Order())
        }
    }
}
