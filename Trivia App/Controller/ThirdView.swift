//
//  ThirdView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI
import CoreData

struct ThirdView: View {
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Answers.entity(), sortDescriptors: []) private var answers: FetchedResults<Answers>
	
	@Binding internal var homeNavlink: Bool
	@State internal var answer: [String]
	@State internal var answer2 =  [String]()
	@State internal var is3rdNavlinkActive = false
	@State private var isChecked = false
	
	var body: some View {
		VStack{
			Text("What are the colors of Indian national flag?")
			
//			ForEach(options.optionSet2, id:\.self.id){option in
//				HStack{
//					Image(systemName: option.option[option.option.keys.first ?? ""] ?? false ? "checkmark.square" : "square")
//					Text(option.option.keys.first ?? "")
//				}
//				.onTapGesture {
//					//
//				}
//			}
			
			Button(action: addItem){
				Text("Finish")
					.frame(width: 100, height: 50, alignment: .center)
					.foregroundColor(.white)
					.background(Color.red)
					.clipShape(Capsule())
				
			}
			
			NavigationLink("", destination: SummeryView(homeNavlink: self.$homeNavlink, answer: self.answer, answer2: self.answer2), isActive: $is3rdNavlinkActive)
			
		}
		
		
		.navigationBarTitle("Third Question", displayMode: .inline)
		
	}
	
	
	func addItem(){
		self.answer2 = ["White", "Pink", "Blue"]
		self.is3rdNavlinkActive.toggle()
		
		let newValue = Answers(context: self.moc)
		newValue.name = self.answer[0]
		newValue.favCricketer = self.answer[1]
		newValue.colors = self.answer2
		
		
		do{
			try self.moc.save()
		}
		catch{
			print("Couldn't save the data")
		}
	}
}


