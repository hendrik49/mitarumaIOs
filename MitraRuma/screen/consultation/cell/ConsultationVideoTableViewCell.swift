//
//  ConsultationVideoTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 30/06/21.
//

import UIKit
import youtube_ios_player_helper

class ConsultationVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoPlayerView: YTPlayerView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var isLoaded: Bool = false
    
    func setUpData(title: String, video: String) {
        titleLabel.text = title
        if (!isLoaded) {
            isLoaded = true
            videoPlayerView.load(withPlaylistId: video, playerVars: ["playsinline": 1])
        }
    }
}
