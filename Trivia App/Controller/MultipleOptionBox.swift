//
//  MultipleOptionBox.swift
//  Trivia App
//
//  Created by administrator on 15/09/2021.
//

import SwiftUI

// Custom View for multiple options
struct MultipleOptionBox: View {
	var title: String
	var isSelected: Bool
	var action: () -> Void
	
	var body: some View {
		Button(action: self.action) {
			HStack {
				Text(self.title)
				if self.isSelected {
					Spacer()
					Image(systemName: "checkmark")
				}
			}
		}
	}
}


