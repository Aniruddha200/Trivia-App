//
//  SeondView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI


// Second View
struct SecondView: View {
	@Binding internal var homeNavlink: Bool
	@State private var questions = Questions().questions
	@State private var options = Options()
	@State internal var answer: [String]
	@State internal var picked = ""
	@State internal var is2ndNavlinkActive = false
	var body: some View {
		VStack(spacing: 30){
			
//Second Question
			Text(questions[1])
				.font(.title2)
			Text("You picked \(picked.isEmpty ? "None": picked)")
//Answer Picker
			Picker("Select anyone", selection: $picked) {
				
				ForEach(options.ops1, id: \.self){option in
					Text(option)
				}
				
			}
			.pickerStyle(MenuPickerStyle())

// Next Button to navigate to third View
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
			.opacity(picked.isEmpty ? 0.5 : 1)
			.disabled(picked.isEmpty)
			
			NavigationLink("", destination: ThirdView(homeNavlink: self.$homeNavlink, answer: self.answer), isActive: $is2ndNavlinkActive)
		}
		.navigationBarTitle("Second Question", displayMode: .inline)
	}
}


