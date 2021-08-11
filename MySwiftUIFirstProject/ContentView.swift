//
//  ContentView.swift
//  MySwiftUIFirstProject
//
//  Created by Админ on 05.08.2021.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    
    @State var isOn = false
    @State var isEditing = false
    @State var speed = 50.0
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Toggle", isOn: $isOn)
                Text("\(isOn.description)").foregroundColor(isOn ? .black : .red)
                Slider(value: $speed, in: 0...100, onEditingChanged: { editing in
                    self.isEditing = editing
                })
                
                Text("\(speed)").foregroundColor(isEditing ? .green : .black)
               
                NavigationLink(
                    destination: SecondView(),
                    label: {
                        Text("View: Text modificator")
                        .accentColor(.white)
                    })
                    .background(Color.blue)
                    .padding(30)

                
                NavigationLink(
                    destination: ThirdView(),
                    label: {
                        Text("View: Authorization screen")
                        .accentColor(.white)
                    })
                    .background(Color.blue)
                
            }.padding()
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Some Title").modifier(Title())
            Text("Some regular text with many words").modifier(RegularText())
        }.padding()
    }
}

struct ThirdView: View {

    var body: some View {
        
        VStack(spacing: 50) {
            ImageView()
                .padding(.top, 100)
            VStack(spacing: 20) {
                TextFieldView()
                ButtonView()
            }
            .padding()
        
            
            TabView {
               Text("")
                 .tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
                  }
                Text("")
                  .tabItem {
                     Image(systemName: "person.fill")
                     Text("Profile")
                   }
                Text("")
                  .tabItem {
                     Image(systemName: "tv.music.note.fill")
                     Text("Player")
                   }
                Text("")
                  .tabItem {
                     Image(systemName: "play.tv.fill")
                     Text("Video")
                   }
                Text("")
                  .tabItem {
                     Image(systemName: "mic.fill")
                     Text("Recorder")
                   }
            }
        }
    }
}


struct ImageView: View {
    var body: some View {
        Image("logo")
            .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
    }
}

struct TextFieldView: View {
    
    @State var login = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing: 0) {
            TextField("Email or login", text: $login)
                .modifier(TextFieldModifier())
            TextField("Password", text: $password)
                .modifier(TextFieldModifier())
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 0.5)))
        .padding()
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray, lineWidth: 0.5)
                ).padding(0)
    }
}

struct ButtonView: View {
    var body: some View {
        Button(action: {
            print("button tapped")
        })
        {
            Text("Log in")
                .frame(width: 340 , height: 50, alignment: .center)
        }
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .buttonStyle(PlainButtonStyle())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.orange)
    }
}

struct RegularText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
    }
}
