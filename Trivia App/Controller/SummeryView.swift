//
//  SummeryView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI


// Summery View for each game
struct SummeryView: View {
	
	@Binding internal var homeNavlink: Bool
	@State private var questions = Questions().questions
	var answer: [String]
	var answer2: [String]
	var body: some View {
		VStack{
			VStack(spacing: 20){
//First Question and answer
				Section{
					Text(questions[0])
						.font(.title2)
					Text("\(answer[0])")
						.font(.title3)
				}
// 2nd Question and answer
				Section{
					Text(questions[1])
						.font(.title2)
					Text("\(answer[1])")
						.font(.title3)
				}
// 3rd Question and answer
				Section{
					Text(questions[2])
						.font(.title2)
					Text("\(answer2.joined(separator: ","))")
						.font(.title3)
				}
			}

// Button to navigate back to home
			
			Button(action: {self.homeNavlink.toggle()}){
				Text("Restart")
					.frame(width: 100, height: 50, alignment: .center)
					.foregroundColor(.white)
					.background(Color.red)
					.clipShape(Capsule())
				
			}
		}
		
		.navigationBarTitle("Summery", displayMode: .inline)
		.navigationBarBackButtonHidden(true)
		
//This navigates to History View
		.navigationBarItems(trailing: NavigationLink("History", destination: HistoryView(homeNavlink: $homeNavlink)))
		
	}
	
	
	
}

