//
//  ThirdView.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//

import SwiftUI
import CoreData

//Third View

struct ThirdView: View {
	
//CoreData Loading Stuffs
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Answers.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) private var answers: FetchedResults<Answers>
	

// Some objects from previous viewa
	@Binding internal var homeNavlink: Bool
	@State internal var answer: [String]
	
//Question, Options, navlink etc object
	@State internal var is3rdNavlinkActive = false
	@State private var questions = Questions().questions
	@State private var items = Options().ops2
	@State internal var selections = [String]()
	
	var body: some View {
		VStack(spacing: 30){
			
// 3rd and last question
			Text(questions[2])
			
//Multiple options list
			Section(header: Text("Select multiple")){
				List {
					ForEach(self.items, id: \.self) { item in
						
//Custom View for Multiple options
						MultipleOptionBox(title: item, isSelected: self.selections.contains(item)) {
							if self.selections.contains(item) {
								self.selections.removeAll(where: { $0 == item })
							}
							else {
								self.selections.append(item)
							}
						}
					}
				}
				.frame(height: 400, alignment: .center)
			}
// Finish Button which saves the data as well as navigate to summery view.
			Button(action: addItem){
				Text("Finish")
					.frame(width: 100, height: 50, alignment: .center)
					.foregroundColor(.white)
					.background(Color.red)
					.clipShape(Capsule())
				
			}
			.opacity(selections.count < 2 ? 0.5 : 1)
			.disabled(selections.count < 2)
			
			NavigationLink("", destination: SummeryView(homeNavlink: self.$homeNavlink, answer: self.answer, answer2: self.selections), isActive: $is3rdNavlinkActive)
			
		}
		
		
		.navigationBarTitle("Third Question", displayMode: .inline)
		
	}
	
// Function to save data to db
	func addItem(){
		self.is3rdNavlinkActive.toggle()
		
		let newValue = Answers(context: self.moc)
		newValue.name = self.answer[0]
		newValue.favCricketer = self.answer[1]
		newValue.colors = self.selections
		
		
		do{
			try self.moc.save()
		}
		catch{
			print("Couldn't save the data")
		}
	}
}



