//
//  MainViewModel.swift
//  SurfTask
//
//  Created by Алексей Ревякин on 01.08.2023.
//

import Foundation

class MainViewModel {
    
    private var skils: [String] = [
        "MVI/MVVM", "Kotlin Coroutines",
        "Room", "OkHttp",
        "DataStore", "WorkManager",
        "custom view", "DataStore",
        "ООП и SOLID"
    ]
    
    var isEditing = false
    
    func numberOfRow() -> Int {
        if isEditing {
            return skils.count + 1
        } else {
            return skils.count
        }
        
    }
    
    func deleteSkil(for index: Int) {
        skils.remove(at: index)
    }
    
    func addSkil(skil: String) {
        skils.append(skil)
    }
    
    func getSkilCellViewModel(for indexPath: IndexPath) -> SkilsCellViewModel {
        if isEditing {
            if indexPath.row == skils.count {
                return SkilsCellViewModel(skil: "+", isEditing: isEditing)
            } else {
                return SkilsCellViewModel(skil: skils[indexPath.row], isEditing: isEditing)
            }
        } else {
            return SkilsCellViewModel(skil: skils[indexPath.row], isEditing: isEditing)
        }
    }
    
    func getSkil(for indexPath: IndexPath) -> String {
        if isEditing {
            if indexPath.row == skils.count {
                return "+"
            } else {
                return skils[indexPath.row]
            }
        } else {
            return skils[indexPath.row]
        }
    }
    
    func isLast(at indexPath: IndexPath) -> Bool {
        return indexPath.row == skils.count
    }
}
