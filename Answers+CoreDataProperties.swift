//
//  Answers+CoreDataProperties.swift
//  Trivia App
//
//  Created by administrator on 15/09/2021.
//
//

import Foundation
import CoreData


extension Answers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answers> {
        return NSFetchRequest<Answers>(entityName: "Answers")
    }

    @NSManaged public var colors: [String]?
    @NSManaged public var favCricketer: String?
    @NSManaged public var name: String?
    @NSManaged public var date: Date?
	
	public var unWrappedName: String{
		name ?? "Unknown"
	}
	
	public var unWrappedFavCricketer: String{
		favCricketer ?? "Unknown"
	}
	
	public var unWrappedColors: [String]{
		colors ?? [String]()
	}
	
	public var unWrappedDate: Date{
		date ?? Date()
	}

}

extension Answers : Identifiable {

}
