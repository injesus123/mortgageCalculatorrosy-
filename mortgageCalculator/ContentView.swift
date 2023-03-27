
//
//  ContentView.swift
//  MortgageLabApp
//
//  Created by Rosy Jacob on 04.07.23
//

import SwiftUI

struct ContentView: View {
    @State private var loanAmount: Double = 0
    @State private var interestRate: Double = 4
    @State private var loanTerm: Double = 25
    @State private var monthlyPayment: Double = 1500

    var body: some View {
        ZStack {
            VStack{
            Image("house")
                .scaledToFit()
                .ignoresSafeArea()
                .frame(width: 200 ,height: 200,
                       alignment: .top)
                .position(x:200,y:20)
                .foregroundColor(.accentColor)
                .opacity(0.2)
            
            Spacer()
            
        

                VStack {
                    Text("Mortgage Calculator")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding()

                    HStack {
                        ZStack {
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)

                            Text("£")
                                .font(.title2)
                                .foregroundColor(.white)
                        }

                        Text("Monthly Payment")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }

                    TextField("Monthly Payment", value: $monthlyPayment, formatter: NumberFormatter())
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 3))
                        .frame(width: 550, height: 50)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)

                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 4)
                                    .frame(width: 10, height: 10)
                                    .offset(x: 9, y: -9)
                            )

                        Text("Loan Period - years")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }

                    TextField("Loan Term", value: $loanTerm, formatter: NumberFormatter())
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 3))
                        .frame(width: 550, height: 50)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)

                    HStack {
                        Text("%")
                            .font(.title)
                            .foregroundColor(.black)
                        Text("Interest Rate")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }

                    TextField("Interest Rate", value: $interestRate, formatter: NumberFormatter())
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 3))
                        .frame(width: 550, height: 50)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)
                                            
                                                    

                    Button("Calculate") {
                        calculateLoanAmount()
                    }
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)

                    Text("Amount that can be borrowed: £\(loanAmount, specifier: "%.2f")")
                        .padding()
                }
                .padding()
            }
        }
    }

    func calculateLoanAmount() {
        let monthlyInterestRate = interestRate / 100 / 12
        let numberOfPayments = loanTerm * 12

        if monthlyPayment > 0 && interestRate > 0 && loanTerm > 0 {
            let A = pow(1 + monthlyInterestRate, numberOfPayments)
            let P = monthlyPayment * (A - 1) / (monthlyInterestRate * A)
            loanAmount = P
        } else {
            loanAmount = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


