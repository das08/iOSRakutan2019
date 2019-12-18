//
//  UserData.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/04.
//  Copyright © 2019 das08. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var rakutandata = rakutanData
    @Published var facultyletter = facultyLetter
    @Published var facultyeducation = facultyEducation
    @Published var facultylaw = facultyLaw
    @Published var facultyeconomics = facultyEconomics
    @Published var facultyscience = facultyScience
    @Published var facultymedicine = facultyMedicine
    @Published var facultymedicinehuman = facultyMedicineHuman
    @Published var facultypharm = facultyPharm
    @Published var facultyengineering = facultyEngineering
    @Published var facultyagriculture = facultyAgriculture
    @Published var facultyihs = facultyIHS
    @Published var facultykkk = facultyKKK
    
}
