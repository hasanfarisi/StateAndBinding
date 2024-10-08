//
//  ContentView.swift
//  stateAndBinding
//
//  Created by mac on 9/30/24.
//

import SwiftUI

//Model data


struct ContentView: View {
    //new data
    let data: [ProductModel] = [
        ProductModel(id: 1, name: "POVA 6 Pro", price: 1450000, photo: "asset1", location: "Kab. Bandung barat", startsCount: 3),
        ProductModel(id: 2, name: "POVA 6 Pro", price: 1350000, photo: "asset2", location: "Kab. Bandung barat", startsCount: 2),
        ProductModel(id: 3, name: "POVA 6 Pro", price: 1600000, photo: "asset3", location: "Kab. Bandung barat", startsCount: 4),
        ProductModel(id: 4, name: "POVA 6 Pro", price: 2450000, photo: "asset4", location: "Kab. Bandung barat", startsCount: 5),
        ProductModel(id: 5, name: "POVA 6 Pro", price: 2000000, photo: "asset5", location: "Kab. Bandung barat", startsCount: 1),
        ProductModel(id: 6, name: "POVA 6 Pro", price: 1900000, photo: "asset6", location: "Kab. Bandung barat", startsCount: 2),
        ProductModel(id: 7, name: "POVA 6 Pro", price: 2400000, photo: "asset7", location: "Kab. Bandung barat", startsCount: 3),
        ProductModel(id: 8, name: "POVA 6 Pro", price: 2890000, photo: "asset8", location: "Kab. Bandung barat", startsCount: 5),
        ProductModel(id: 9, name: "POVA 6 Pro", price: 1850000, photo: "asset9", location: "Kab. Bandung barat", startsCount: 4),
        ProductModel(id: 10, name: "POVA 6 Pro", price: 3150000, photo: "asset10", location: "Kab. Bandung barat", startsCount: 5)
    ]
    
    //@State var chartTotal:Int = 0
    @ObservedObject var globaldata = GlobalObject()
    var body: some View {
        //Product()
        
        NavigationView{
            ScrollView{
                ForEach(data){ row in
                    VStack(spacing:10){
                        Product(data: row, chartTotal: self.globaldata)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Handphone")
            .navigationBarItems(
                trailing:
                    HStack{
                        Button(action: {print("OK")}){
                            Image(systemName: "person.fill")
                        }
                        NavigationLink(destination: detailView(globaldata: globaldata)){
                            chartView(chartTotal: globaldata)
                        }
                    }
            )
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}

struct detailView:View {
    @ObservedObject var globaldata: GlobalObject
    
    var body: some View {
        NavigationView{
            Text("Detail")
                .navigationBarTitle("Detail")
                .navigationBarItems(
                    trailing:
                        HStack{
                            Button(action: {print("OK")}){
                                Image(systemName: "person.fill")
                            }
                            
                            chartView(chartTotal: globaldata)
                        }
                )
        }
    }
}

struct chartView:View {
    //@Binding var total:Int
    @ObservedObject var chartTotal: GlobalObject
    var body: some View {
        ZStack{
            Image(systemName: "cart.fill")            
            
            Text("\(chartTotal.count)")
                .foregroundColor(Color.white)
                .frame(width: 10, height: 10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x:10, y:-10)
        }
    }
}

struct Product:View {
    
    let data:ProductModel
    //@Binding var productTotal:Int
    @ObservedObject var chartTotal: GlobalObject
    
    var body: some View {
        VStack(alignment:.leading){
            ZStack(alignment:.topTrailing){
                Image(self.data.photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 400)
                    .clipped()
                
                Button(action: {print("OK")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(Color.red)
                }
            }
            
            Text(self.data.name)
                .font(.title)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp.\(self.data.price)")
                .font(.title)
                .foregroundColor(Color.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.location)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                HStack{
                    ForEach(0..<self.data.startsCount){
                        items in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
            
            addChart(chart: chartTotal)
        }
        .background(Color("customColor"))
        .cornerRadius(15)
    }
}

struct addChart:View {
    //@Binding var total:Int
    @ObservedObject var chart:GlobalObject
    
    var body: some View {
        Button(action: {chart.count += 1}){
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart.badge.plus")
                        .foregroundColor(Color.white)
                    Text("Tambah keranjang")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding()
    }
}
