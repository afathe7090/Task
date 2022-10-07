//
//  DateFormatter.swift
//  Task
//
//  Created by Ahmed Fathy on 07/10/2022.
//

import Foundation

extension String {
    func toDate(dateFormat: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        let date: Date? = dateFormatter.date(from: self)
        return date
    }
    

}

func changeDateFormat(dateString: String, fromFormat: String, toFormat: String) ->String {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = fromFormat
    let date = inputDateFormatter.date(from: dateString)
    
    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = toFormat
    return outputDateFormatter.string(from: date!)
}
