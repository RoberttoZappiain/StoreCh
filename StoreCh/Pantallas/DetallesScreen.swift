//
//  DetallesScreen.swift
//  StoreCh
//
//  Created by Robertto Flores on 22/11/21.
//

import SwiftUI

struct DetallesScreen: View {
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                DescriptionView()
                    .offset(y: -40)
            }
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundColor(Color.white)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Agregar al carrito")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            //borde sup izquierdo con radio se necesita RoundedCorner y extension dentro funcion cornerRadius declarados abajo
            .cornerRadius(50, corners: .topLeft)
            //
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
//Codigo necesario para border circular
struct RoundedCorner: Shape{
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize (width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
//Aqui se termina


struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Silla de lujo \nSweet")
                .font(.title)
                .fontWeight(.bold)
            HStack{
                ForEach(0 ..< 5){item in
                    Image("star")
                }
                Text("4.9")
                    .opacity(0.5)
                    .padding()
                Spacer()
            }
            Text("Descripcion")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("La silla Sweet de lujo esta dise;ada para espacios cerrados y habitaciones en las que la luz sea todo lo que pueda observar")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Tama;o")
                        .fontWeight(.semibold)
                        .padding(.bottom,4 )
                    Text("Altura: 120cm")
                        .opacity(0.6)
                    Text("Base: 80cm")
                        .opacity(0.6)
                    Text("Diametro: 120cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading){
                    Text("Distribuidor")
                        .fontWeight(.semibold)
                        .padding(.bottom,4 )

                    Text("Jati Wood, Canvas \nAmazin Love")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            .padding(.vertical)
            
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)

                        ColorDotView(color: Color("Primary"))
                    }
                }
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Cantidad")
                        .fontWeight(.semibold)
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        //.frame(width: 30, height: 30)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color : Color

    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}



struct DetallesScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetallesScreen()
    }
}
