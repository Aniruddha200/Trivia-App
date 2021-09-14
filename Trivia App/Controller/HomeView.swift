//
//  ContentView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI
import CoreData

struct HomeView: View {
	
	@State private var text = ""
	@State internal var is1stNavlinkActive = false
	
	var body: some View {
		NavigationView{
			VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30){
				Text("What's your name?")
				
				TextField("", text: $text)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.pink, lineWidth: 5))
					.padding(20)
				
				Button(action: {self.is1stNavlinkActive.toggle()}){
					Text("Next")
						.frame(width: 100, height: 50, alignment: .center)
						.foregroundColor(.white)
						.background(Color.red)
						.clipShape(Capsule())
					
				}
				
				NavigationLink("", destination: SecondView(homeNavlink: self.$is1stNavlinkActive, answer: [self.text]), isActive: $is1stNavlinkActive)
			}
			
			
			
			
			
			.navigationBarTitle("Home", displayMode: .inline)
				.navigationBarItems(trailing: NavigationLink("History", destination: HistoryView(homeNavlink: $is1stNavlinkActive)))
		}
	}
}

