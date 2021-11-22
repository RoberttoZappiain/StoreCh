//
//  ContentView.swift
//  StoreCh
//
//  Created by Robertto Flores on 21/11/21.
//

import SwiftUI

struct ContentView: View {
    //Se usa en el foreach del scrollview para mantener el estado de la linea cafe
    @State private var selectedIndex: Int = 0
    //
    private let categories = ["Todo", "Sillas", "Sofa", "Lamparas", "Cocina", "Sencillas" ]
    
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
        
            ScrollView{
                VStack(alignment: .leading){
                   AppBarView()
                    TextTitleView()
                        .padding()
                    
                    SearchAndScanView()

                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< categories.count){i in
                                CategoryView(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }
                        .padding()
                    }
                    
                    
                    Text("Popular")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< 4){ index in
                                ProductCardView(image: Image("chair_\(index + 1)"),size:210)

                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    
                    Text("Nuevo")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< 4){ index in
                                ProductCardView(image: Image("chair_\(index + 1)"),size:180)

                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                }
            }
            //FINALIZA SCROLLVIEW PADRE
            
            //CUSTOM NAVBAR BUTTOM
            HStack{
                
                BottomNavBarItem(image: Image("Home")){}
                BottomNavBarItem(image: Image("fav")){}
                BottomNavBarItem(image: Image("shop")){}
                BottomNavBarItem(image: Image("User")){}

            }
            .padding()
            .background(Color(.white))
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View{
        HStack{
            Button(action:{}){
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}
struct TextTitleView: View {
    var body: some View{
        Text("Encuentra los \nMejores")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text(" hornos")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}
struct SearchAndScanView: View {
    @State private var search: String = ""

    var body: some View{
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing,8)
                TextField("Buscar Hornos", text: $search)

            }
            .padding(.all, 20)
            .background(Color(.white))
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
           
        }
        .padding(.horizontal)
    }
}
struct CategoryView: View {

    let isActive: Bool
    let text: String
       
    var body: some View{
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            
            if (isActive) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
           
        }
        .padding(.trailing)
    }
}
struct ProductCardView: View {
    let image : Image
    let size : CGFloat
    var body: some View{
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Sillas de lujo")
                .font(.title3)
                .fontWeight(.bold)
            
            
            HStack(spacing: 2){
                ForEach(0 ..< 5){ item in
                    Image("star")
                }
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        
        .frame(width: 210)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}
struct BottomNavBarItem: View{
    let image : Image
    let action : ()-> Void
    var body: some View{
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}
