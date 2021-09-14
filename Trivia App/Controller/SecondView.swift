//
//  SeondView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI

struct SecondView: View {
	@Binding internal var homeNavlink: Bool
	@State internal var answer: [String]
	@State internal var picked = ""
	@State internal var is2ndNavlinkActive = false
	var body: some View {
		VStack{
			Text("Who's your favourite cricketer?")
			
			Picker("Select anyone", selection: $picked) {
				
				Text("Sachine Tendulkar")
				Text("Virat Kolli")
				Text("Adam GilChrist")
				
			}
			.pickerStyle(InlinePickerStyle())
			
			Button(action: {
				self.answer.append(self.picked)
				self.is2ndNavlinkActive.toggle()
				
			}){
				Text("Next")
					.frame(width: 100, height: 50, alignment: .center)
					.foregroundColor(.white)
					.background(Color.red)
					.clipShape(Capsule())
				
			}
			
			NavigationLink("", destination: ThirdView(homeNavlink: self.$homeNavlink, answer: self.answer), isActive: $is2ndNavlinkActive)
		}
		.navigationBarTitle("Second Question", displayMode: .inline)
	}
}


