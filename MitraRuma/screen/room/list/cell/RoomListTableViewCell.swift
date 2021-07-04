//
//  RoomListTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/07/21.
//

import UIKit

class RoomListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewLastChatLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusContainerView: UIView!
    @IBOutlet weak var unreadMessageLabel: UIView!
    @IBOutlet weak var unreadMessagesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    func setUpData(entity: RemoteRoomEntity, isApplicator: Bool) {
        titleLabel.text = "\(entity.name)#\(entity.consultationId)"
        previewLastChatLabel.text = entity.text
        unreadMessagesLabel.text = "10"
        timeLabel.text = entity.date
        topConstraint.constant = isApplicator ? -unreadMessageLabel.bounds.height : 8
        statusContainerView.isHidden = !isApplicator
    }
}
