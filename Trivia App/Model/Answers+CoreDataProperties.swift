//
//  Answers+CoreDataProperties.swift
//  Trivia App
//
//  Created by administrator on 14/09/2021.
//
//

import Foundation
import CoreData


extension Answers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answers> {
        return NSFetchRequest<Answers>(entityName: "Answers")
    }

    @NSManaged public var name: String?
    @NSManaged public var favCricketer: String?
    @NSManaged public var colors: [String]?
	
	public var unWrappedName: String{
		name ?? "Unknown"
	}
	
	public var unWrappedFavCricketer: String{
		favCricketer ?? "Unknown"
	}
	
	public var unWrappedColors: [String]{
		colors ?? [String]()
	}

}

extension Answers : Identifiable {

}
