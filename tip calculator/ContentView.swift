//
//  ContentView.swift
//  tip calculator
//
//  Created by Kehinde Oyewale on 01/01/2023.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
       @State private var checkAmount = 0.0
       @State private var numberOfPeople = 2
       @State private var tipPercentage = 20
       let tipPercentages = [10,15,20,25,0]
       var totalPerson: Double{
           let peopleCount = Double(numberOfPeople + 2)
           let tipSelection = Double(tipPercentage)
           let tipValue = checkAmount/100 * tipSelection
           let grandTotal = checkAmount + tipValue
           let amountPerPerson = grandTotal / peopleCount
           
           return amountPerPerson
       }
       var body: some View {
           NavigationView{
               Form{
                   Section {
                       TextField("Amount", value: $checkAmount, format:.currency(code: Locale.current.currency?.identifier ?? "USD") ).keyboardType(.numberPad).focused($amountIsFocused)
                   }
                   Section{
                      
                       Picker("Tip percentage", selection: $tipPercentage){
                           ForEach(0..<101, id: \.self){
                               Text($0, format:.percent)
                           }
                       }
                       .pickerStyle(.menu)
                   }header: {
                       Text("How much Tip do you want to leave?")
                           .multilineTextAlignment(.leading)
                   }
                   Section{
                       Picker("Number of people",selection: $numberOfPeople){
                           ForEach(2..<100){
                               Text("\($0) people")
                           }
                           
                       }
                       
                   }
                   Section{
                       Text(totalPerson * Double(numberOfPeople+2), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                   }header: {
                       Text("Total amount")
                   }
                   Section{
                       Text(totalPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                   }header: {
                       Text("Amount per person")
                   }
                 
               }
           }.navigationTitle("Sample Application").toolbar{
               ToolbarItemGroup(placement:.keyboard){
                   Spacer()
                   Button("Done"){
                       amountIsFocused = false
                   }
               }
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
