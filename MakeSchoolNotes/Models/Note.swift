//
//  File.swift
//  MakeSchoolNotes
//
//  Created by Luca Hagel on 6/21/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationDate = NSDate()
}