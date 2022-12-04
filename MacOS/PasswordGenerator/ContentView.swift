//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Max  on 15/10/2022.
//
import SwiftUI

//main view still need to clean variable


struct ContentView: View {
//variable of the contnet view
    @State var textcolor: Color = .gray //text color if not selected
    @State var textToUpdate = "" //text to update
    @State  var value = 0 //start Value
    @State  var security = "" //security value
    @State var showingAlert = false //alert
    @State var showingAlert2 = false //alert
    @State var showingAlert3 = false //alert
    @State private var Number = true
    @State private var special = false
    @State  var pass = ""

var body: some View {

    VStack {
        
        Image("logo")
            .resizable()
            .cornerRadius(10)
            .frame(width: 35,height: 35)
        
        HStack{
            Text(" length of the password : \(value) characters")
                .foregroundColor(Color.blue)
                .font(Font.headline)
            Stepper {
                
            } onIncrement: {
                incrementStep()
                update()
                //+characters
                
            } onDecrement: {
                decrementStep()
                update()
                //-Characters
            }
        }
        
        
        
//toogle part
        //view of the 2 toggle
        Toggle(isOn: $Number) {
        Text("Generate with number and special characters")
        }
        .disabled(special == true)
        Toggle(isOn: $special) {
            Text("Generate just Number")
        }
        .disabled(Number == true)
        
       
            HStack {
                
                
                
                
                TextField("", text: $pass)
                    .disabled(true)
                    .cornerRadius(10)
                    .frame(width: 300,height: 40)
                    .foregroundColor(textcolor)
                    .font(Font.headline)
                
                
                
//code to copy to clipboard
//need to fix it a little
                
Button {
 //copy thepasswoard to clipoard
                    print("copy passwoard")
                    let pasteboard = NSPasteboard.general
                    pasteboard.prepareForNewContents()
                    pasteboard.writeObjects([pass as NSString])
                    //not work all the time
                    if (pass == "") { //if the string is empty show alert to warn user
                        showingAlert2 = true
                    }
                    if (value >= 5)  {
                        showingAlert3 = true
                    }
                
                    
                    
                } label: {
                    
                    
                    Image(systemName: "doc.on.doc")
                    
                    
                }
                
                Button {
                   
                    if (value == 0) {
                    showingAlert = true
                    }else {
                        update()
                    }
                } label: {
                    
                    Image(systemName: "goforward")
                    
                    
                }
                
                
              
                
            }
            .padding(10)
        
        HStack {
            Image(systemName: "lock.circle")
                .resizable()
                .frame(width: 20,height: 20)
                .foregroundColor(textcolor)
            Text(" \(textToUpdate)")
                .foregroundColor(textcolor)
            
               
        }
        VStack{
            
            Text("created with ❤️ by max21910 in 🇫🇷")
            Text("Ver: \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) ")
            
            Text("Support this project on github :")
            
            
            //link button to redirect user to github
            Link(destination: URL(string: "https://github.com/max21910/PasswordGenerator")!, label: {
                Label("Github link", systemImage: "link.circle")
                    .font(.system(size: 18).bold())
                    .padding(6)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(6)
            })
        
    

            //quit button
            Button("Quit") {
                NSApp.terminate(self)
            }
            
            
            
        
                
                
                    .alert("please select more than 5 characters", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                        
                    }
                    .alert("No password to copy to clipboard", isPresented: $showingAlert2) {
                        Button("OK", role: .cancel) { }
                        
                    }
                    .alert("password succefuly copied", isPresented: $showingAlert3) {
                        Button("OK", role: .cancel) { }
                        
                    }
            }
        }
    }
func valueState() {
        if (value == 0) { //if no characters is select show the warning message
            showingAlert = true
        }
    }
    
    
    func update() {
        
        // check the toggle option and do what the user choose with or without number
        if Number == true {
            pass = randomPassword(pwdLength: value)
           
        }
       else {
            pass = randomPasswordL(pwdLength: value)
            
        }
        if special == true {
            pass = randomPasswordN(pwdLength: value)
           
            
        }
        
print("generation completed \(randomPassword(pwdLength: value))")
        
        
        
        
    }
    
    
    func passchecker() {
        
        
        if value < 10 {
            self.textToUpdate = "Is weak 🔴"
            self.textcolor = .red
        }
        if value > 15 {
            self.textToUpdate = "Is ok 🟠"
            self.textcolor = .orange
            
        }
        if value > 20 {
            self.textToUpdate = "Very good 🟢"
            self.textcolor = .green
            
        }
    }
    func incrementStep() {
        
        value = value + 5
        if value >= 35 {
            value = 0
        }
        
        passchecker()
    }
    
    
    
    func decrementStep() {
        value = value - 5
        if value <= -5 {
            value = 0
        }
        passchecker()
        
        
    }
}
    
        
    

    
    

   
  

    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
