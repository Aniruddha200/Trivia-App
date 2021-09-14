//
//  SummeryView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI

struct SummeryView: View {
	
	@Binding internal var homeNavlink: Bool
	var answer: [String]
	var answer2: [String]
    var body: some View {
		VStack{
			VStack(spacing: 20){
				Section{
				Text("What's your name?")
					.font(.title)
				Text("\(answer[0])")
					.font(.title3)
				}
				
				Section{
				Text("Who's your favourite cricketer?")
					.font(.title)
				Text("\(answer[1])")
					.font(.title3)
				}
				
				Section{
				Text("What're the colors of Indian national flag?")
					.font(.title)
				Text("\(answer2.joined(separator: ","))")
					.font(.title3)
				}
			}
			
			
			Button(action: {self.homeNavlink.toggle()}){
				Text("Restart")
					.frame(width: 100, height: 50, alignment: .center)
					.foregroundColor(.white)
					.background(Color.red)
					.clipShape(Capsule())
				
			}
		}
		
		.navigationBarTitle("Summery", displayMode: .inline)
		.navigationBarItems(trailing: NavigationLink("History", destination: HistoryView(homeNavlink: $homeNavlink)))
		
    }
	
	
	
}

