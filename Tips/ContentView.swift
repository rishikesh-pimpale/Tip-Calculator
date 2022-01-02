//
//  ContentView.swift
//  Tips
//
//  Created by Rishikesh Pimpale on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var total = "100"        // default amount
    @State var tipPercent = 15.0    // default tip percent
    
    var body: some View {
        
        VStack {
            
            // title
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // placeholder/input for amount
            HStack {
                Text("$")
                TextField("Amount", text: $total)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            HStack{
                
                // scale for tip percentage
                Slider(value: $tipPercent,
                       in: 5...25,
                       step: 1.0)
                
                Text("\(Int(tipPercent))%")
            }
            .padding()
            
            // validate input
            if let totalNum = Double(total){
                
                let calculatedTip = (totalNum * tipPercent) / 100.0
                
                VStack{
                    
                    // display tip amount
                    Text("Tip Amount: $\(calculatedTip, specifier: "%0.2f")")
                        .padding()
                    
                    // display total amount
                    Text("Total $\(totalNum + calculatedTip, specifier: "%0.2f")")
                        .padding()
                }
            }
            else{
                Text("Please enter a numeric value")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
