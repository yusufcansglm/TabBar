//
//  TabBar2DemoView.swift
//  AnimatedApp
//
//  Created by yusuf can on 14.11.2023.
//

import SwiftUI


struct ContentView: View {
    
    @Binding var selectedTab : String
    @Namespace var animation
    
    var body: some View {
        
        Spacer()
        
        HStack(spacing: -13)
        {
            TabButton(image: "house.circle", title: "Home", animation: animation, selectedTab: $selectedTab)
            TabButton(image: "gear.circle", title: "Setting", animation: animation, selectedTab: $selectedTab)
            TabButton(image: "bell.circle", title: "Notification", animation: animation, selectedTab: $selectedTab)
            TabButton(image: "questionmark.circle", title: "Help", animation: animation, selectedTab: $selectedTab)
        }.padding(.vertical,-7)
        .background(Color.black)
            .clipShape(Capsule())
            .shadow(radius: 7)
            
        
    }
}









struct TabItem: Identifiable {
    var id = UUID()
    var icon: Image
    var tab: Tab
}


enum Tab: String {
    case house
    case gear
    case bell
    case questionmark
}


struct TabButton: View {
    var image: String
    var title: String
    var animation: Namespace.ID
    @Binding var selectedTab: String
    @State var show = false
    var body: some View {
        
        
       Button(action: {
           withAnimation(.spring()){
               selectedTab = title
               show = false
           }
       }, label: {
           VStack(spacing:3){
               Image(systemName: image)
                   .symbolRenderingMode(.palette)
                   .foregroundStyle(.primary,.pink)
                   .imageScale(.large)
                  
                   
                   
               Text(title)
                   .font(.caption2)
                   .fontWeight(.bold)
                   .frame(width: 70)
           }
           .foregroundColor(selectedTab == title ? Color(.black) : .white)
          
           .padding()
           .background(
            ZStack{
                if selectedTab == title{
                    Color.white
                        .opacity(selectedTab == title ? 1 : 0)
                   .clipShape(CustomCorner(corner: [.topRight, .bottomRight], radius: 5))
                   .matchedGeometryEffect(id: "TAB", in: animation)
                }
            }
           
           )
       })
      
        
        
      
     
    }
}



struct CustomCorner: Shape{
    var corner: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}




