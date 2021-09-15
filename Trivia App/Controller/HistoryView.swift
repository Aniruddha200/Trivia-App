//
//  SummeryView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI
import CoreData

struct HistoryView: View {
	
// Coredata Stuffs
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Answers.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) private var answers: FetchedResults<Answers>
	
//Navlink object
	@Binding internal var homeNavlink: Bool
	
	var body: some View {
		VStack(spacing: 30){
			
//List of previous game
			List{
				ForEach(0..<answers.count){num in
					Text("Game\(num) - \(dateFormatter(answers[num].unWrappedDate))")
						.fontWeight(.bold)
					Text("Name: \(answers[num].unWrappedName)")
					Text("Favourite Crickerter: \(answers[num].unWrappedFavCricketer)")
					Text("Colors: \(answers[num].unWrappedColors.joined(separator: ","))")
				}
			}
			
// Button to Navigate back to Home View
			Button(action: {self.homeNavlink.toggle()}){
				Text("Home")
					.frame(width: 100, height: 50, alignment: .center)
					.foregroundColor(.white)
					.background(Color.red)
					.clipShape(Capsule())
				
			}
		}
		.navigationBarTitle("History", displayMode: .inline)
	}
	
	
// function to format the date
	func dateFormatter(_ date: Date) -> String{
		let formatter = DateFormatter()
		formatter.dateStyle = .short
		formatter.timeStyle = .short
		
		return formatter.string(from: date)
	}
	
	
	
}

