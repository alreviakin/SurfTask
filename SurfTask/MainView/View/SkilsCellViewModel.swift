//
//  SkilsCellViewModel.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import Foundation

class SkilsCellViewModel {
    var skil: String
    var isEditing: Bool
    var index: Int = 0
    
    init(skil: String, isEditing: Bool) {
        self.skil = skil
        self.isEditing = isEditing
    }
}
