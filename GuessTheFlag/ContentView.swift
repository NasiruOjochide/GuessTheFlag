//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Danjuma Nasiru on 27/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    func deleteSomething(){
        print("deleting now!!!")
    }
    
    var body: some View {
        
        //PRESSING SHIFT CMD A FLIPS BETWEEN LIGHT AND DARK MODE IN SIMULATOR
        
        //naturally swiftui places our content in the safe area which is the entire screen without the top part where the clock appears and the bottom part as well where that minimize icon is. we can make our content take the full length of the screen by using the ignoreSafeArea modifier. we can even choose if its only the top we want to ignore or the bottom or both or keyboard safe area.
        //spacers take up the remaining available space in a stack. if you put 3 spacers, they calculate the entire remaining space then divide it by 3 and take one-third each
        //vstacks have spacing and alignment, alignment can be left, right or center. Hstacks have the same albeit alignment is top, bottom or center. The last stack is zstack without spacing but also has alignment
        VStack{
            
            //in swift, color can act as a view just like shapes or text as used in the zstack below. we could of couse use it as a background because the background modifier takes in a view, so any view can be a background and so can color
            //the background can also take semantic values like primary or secondary which provides a color basd on system default say light mode or dark mode.
            //It can also take an utra thin material that uses the thinnest material, which means we’re letting a lot of the background colors shine through our frosted glass effect. iOS automatically adapts the effect based on whether the user has light or dark mode enabled – our material will either be light-colored or dark-colored, as appropriate.
            ZStack {
                VStack(spacing: 0){
                    Color.red
                    Color.blue
                }
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                Text("Your content")
                    .foregroundColor(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
            
            Spacer()
            HStack{
                Spacer()
                Text("First")
                Spacer()
                Text("Second")
                Spacer()
                Text("Third")
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text("Fourth")
                Spacer()
                Text("Fifth")
                Spacer()
                Text("Sixth")
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text("Seventh")
                Spacer()
                Text("Eight")
                Spacer()
                Text("Ninth")
                Spacer()
            }
            Spacer()
            
            //swift allows us secify gradients, it could be linear like top to bottom, radial that takes a particular start and end radius, or angular gradients
            //we could also specify how much space we want each color of the gradient to occupy using stops
            
            
            //            LinearGradient(gradient: Gradient(colors: [.white,.black]), startPoint: .top, endPoint: .bottom)
            
            
            //            LinearGradient(stops: [Gradient.Stop(color: .white, location: 0.15),Gradient.Stop(color: .gray, location: 0.85)], startPoint: .top, endPoint: .bottom)
            
            //            RadialGradient(colors: [.red,.blue,.yellow,.gray,.black,.white], center: .bottom, startRadius: 20, endRadius: 200)
            
            AngularGradient(gradient: Gradient(colors: [.red,.blue,.black,.gray,.purple]), center: .center)
            
            
            //buttons
            //we can use trailing closures for the action of a button or just pass in a method into the action parameter
            VStack {
                Button("Delete", role: .destructive, action: deleteSomething)
                
                Button("Button 1") { }
                    .buttonStyle(.bordered)
                Button("Button 2", role: .cancel) { }
                    .buttonStyle(.bordered)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                //custom button
                Button{
                    print("Button was tapped")
                } label: {
                    Text("Tap me!")
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                }
                //we could also have images as labels in buttons
                Button{
                    print("Button was tapped")
                } label: {
                    Image(systemName: "pencil").resizable().frame(width: 60, height: 30)
                }
                //if we want text plus image as label, we could do this
                Button{
                    print("Button was tapped")
                } label: {
                    Label("Edit!", systemImage: "pencil")
                }
                
                //If you find that your images have become filled in with a color, for example showing as solid blue rather than your actual picture, this is probably SwiftUI coloring them to show that they are tappable. To fix the problem, use the renderingMode(.original) modifier to force SwiftUI to show the original image rather than the recolored version.
                
                //we can show a swiftui alert by adding an alert modifier to a button. the modifier has a two way bool binding that helps us set whether the alert should display or not. clicking the button will set it to true. Closing the alert will set it back to false and dismiss the alert.
                //our alert can have multiple buttons with different roles. each button can do something more if you want but by default its action is to exit the alert
                //also the alert modifier can be placed anywhere, what triggers is is what matters, in this case the show alert button because it holds the state property that either shows or removes the alert
                //the alert can also have an extra message underneath the title
                Button("Show Alert") {
                    showingAlert = true
                }
                .alert("Important message", isPresented: $showingAlert) {
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Please read this.")
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
