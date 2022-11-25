//
//  Preferences.swift
//  Science4You
//
//  Created by apprenant83 on 02/11/2022.
//

import Foundation

struct Theme {
    let mnemo: String
    let label: String
    var isSelected: Bool = false
    var selectedLevel: Int = 1  // niveau débutant (facile) par défaut
}

class Preferences: ObservableObject {
    @Published var themes: [Theme] = []
    @Published var simulated: Bool = false

    init() {
        themes.append(Theme(mnemo: "astr", label: "Astronomie"))
        themes.append(Theme(mnemo: "chim", label: "Chimie"))
        themes.append(Theme(mnemo: "phys", label: "Physique"))
        themes.append(Theme(mnemo: "math", label: "Mathématiques"))
        themes.append(Theme(mnemo: "tech", label: "Technologie"))
        themes.append(Theme(mnemo: "svt", label: "Sciences de la Terre"))
        themes.append(Theme(mnemo: "bio", label: "Biologie"))
        themes.append(Theme(mnemo: "med", label: "Médecine"))
    }

    func getIndex(_ mnemo: String) -> Int {
        let index = themes.firstIndex(where: { theme in theme.mnemo == mnemo })
        if let index {
            return index
        } else {
            return -1   // le mnemo n'existe pas
        }
    }

    func label(_ mnemo: String) -> String {
        let index = getIndex(mnemo)
        if index >= 0 {
            return themes[index].label
        } else {
            return ""   // le mnemo n'existe pas
        }
    }

    func isSelected(_ mnemo: String) -> Bool {
        let index = getIndex(mnemo)
        if index >= 0 {
            return themes[index].isSelected
        } else {
            return false   // le mnemo n'existe pas
        }
    }

    func select(_ mnemo: String) {
        let index = getIndex(mnemo)
        if index >= 0 {   // si le mnemo existe
            themes[index].isSelected = true
        }
    }

    func unselect(_ mnemo: String) {
        let index = getIndex(mnemo)
        if index >= 0 {   // si le mnemo existe
            themes[index].isSelected = false
        }
    }

    func selectedLevel(_ mnemo: String) -> Int {
        let index = getIndex(mnemo)
        if index >= 0 {
            return themes[index].selectedLevel
        } else {
            return 0   // le mnemo n'existe pas
        }
    }
}
