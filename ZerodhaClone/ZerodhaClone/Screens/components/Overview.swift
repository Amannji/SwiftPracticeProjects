//
//  Overview.swift
//  ZerodhaClone
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct Overview: View {
    @Binding var showOverview: Bool
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text("Overview")
                    .font(.system(size:30,weight: .bold, design:.rounded))
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size:30,weight: .medium, design:.rounded))
                    .onTapGesture {
                        showOverview = false
                    }
            }
            .padding([.horizontal,.bottom], 15)
            HStack{
                IndexSubView(index: index1)
                IndexSubView(index: index2)
            }
            .padding()
            Text("* Chart indicates 52 weeks trend")
                .font(.subheadline)
                .foregroundColor(Color.secondary)
                .padding()
            Divider()
                .padding(.horizontal)
            VStack(alignment: .leading){
                Text("Funds")
                    .padding(.vertical, 15)
                    .font(.title3)
                Text("Equity")
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
                Text("$\(2126.50,specifier: "%.2f")")
                    .font(.title2)
            }

            .padding()
         Spacer()
        
        }

        .background(Color(.systemGray6))
        
        
        
    }
        
}

#Preview {
    Overview(showOverview: .constant(true))
}

struct IndexSubView: View {
    var index:Index
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text(index.title)
                .font(.title3)
                .fontWeight(.medium)
            Text("\(index.indexLevel, specifier:"%.2f")")
                .font(.title2)
            HStack(spacing: 20){
                Group{
                    Text("\(index.change, specifier:"%.2f")")
                    Text("\(index.percentageChange,specifier:"%.2f")%")
                }
                .font(.subheadline)
                .foregroundColor( index.change > 0 ? Color.green : Color.red)
            }
            LineChart()
                .padding(.top,20)
        }
    }
}


struct Stock{
let price: Double
}


private func getPrices()->[Stock]{
    var stocks = [Stock]()
    
    for _ in 1...50{
        let stock = Stock(price: Double.random(in:1...20))
        stocks.append(stock)
    }
    return stocks
}

struct LineChart: View{
    let prices = getPrices().map{Int($0.price)}
    let screenWidth = UIScreen.main.bounds.width/2
    
    private var path: Path{
        if prices.isEmpty{
            return Path()
        }
        var offsetX: Int = 0
        var path = Path()
        path.move(to: CGPoint(x: offsetX, y: prices[0]))
        for price in prices{
            offsetX += Int(screenWidth/CGFloat(prices.count))
            path.addLine(to: CGPoint(x: offsetX, y: price))
            
        }
        return path
    }
    var body: some View{
        VStack{
            path.stroke(Color.blue, lineWidth: 1.0)
                .frame(height:20)
        }
    }
}


struct Index{
    let title: String
    let indexLevel: Double
    let change: Double
    let percentageChange: Double
}

var index1 = Index(title:"NIFTY 50", indexLevel: 21462.25, change: -109.70, percentageChange: -0.51)
var index2 = Index(title:"NIFTY BANK", indexLevel: 45713, change: -350.70, percentageChange: -0.71)
