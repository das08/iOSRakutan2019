import UIKit
import SwiftUI
import CoreLocation

let rakutanData: [RakutanData] = load("data.json")
let facultyLetter:[RakutanData] = load("L.json")
let facultyEducation:[RakutanData] = load("P.json")
let facultyLaw:[RakutanData] = load("J.json")
let facultyEconomics:[RakutanData] = load("E.json")
let facultyScience:[RakutanData] = load("S.json")
let facultyMedicine:[RakutanData] = load("MM.json")
let facultyMedicineHuman:[RakutanData] = load("MH.json")
let facultyPharm:[RakutanData] = load("Ph.json")
let facultyEngineering:[RakutanData] = load("T.json")
let facultyAgriculture:[RakutanData] = load("A.json")
let facultyIHS:[RakutanData] = load("H.json")
let facultyKKK:[RakutanData] = load("KKK.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
