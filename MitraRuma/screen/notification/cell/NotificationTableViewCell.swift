//
//  NotificationTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 19/06/21.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationDateLabel: UILabel!
    @IBOutlet weak var notificationIndicatorView: UIView!
    
    func setUpData(entity: RemoteNotificationEntity) {
        notificationLabel.text = entity.title
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var date = Date()
        date.addTimeInterval(entity.createdDate)
        notificationLabel.text = dateFormatterGet.string(from: date)
    }
    
}
