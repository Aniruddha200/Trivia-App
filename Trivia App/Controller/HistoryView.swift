//
//  SummeryView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI
import CoreData

struct HistoryView: View {
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Answers.entity(), sortDescriptors: []) private var answers: FetchedResults<Answers>
	
	@Binding internal var homeNavlink: Bool
	
	var body: some View {
		VStack(spacing: 30){
			List{
				ForEach(answers){answer in
					Text("Name: \(answer.unWrappedName)")
						.fontWeight(.bold)
					Text("Favourite Crickerter: \(answer.unWrappedFavCricketer)")
					Text("Colors: \(answer.unWrappedColors.joined(separator: ","))")
				}
			}
			
			
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
	
	
	
}

