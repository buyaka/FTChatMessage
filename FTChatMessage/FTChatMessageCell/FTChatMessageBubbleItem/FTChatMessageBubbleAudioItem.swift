//
//  FTChatMessageBubbleAudioItem.swift
//  ChatMessageDemoProject
//
//  Created by liufengting on 16/5/7.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

import UIKit

class FTChatMessageBubbleAudioItem: FTChatMessageBubbleItem {
    
    var playImageView : UIImageView!
    var mediaInfoLabel : UILabel!
    
    convenience init(frame: CGRect, aMessage : FTChatMessageModel) {
        self.init(frame:frame)
        self.backgroundColor = UIColor.clear
        message = aMessage
        messageBubblePath = self.getAudioBubblePath(frame.size, isUserSelf: aMessage.isUserSelf)
        
        let layer = CAShapeLayer()
        layer.path = messageBubblePath.cgPath
        layer.fillColor = aMessage.messageSender.isUserSelf ? FTDefaultOutgoingColor.cgColor : FTDefaultIncomingColor.cgColor
        self.layer.addSublayer(layer)
        
        let mediaImageRect = self.getPlayImageViewFrame(aMessage.isUserSelf)
        playImageView = UIImageView(frame : mediaImageRect)
        playImageView.backgroundColor = UIColor.clear
        playImageView.image = UIImage(named: "Media_Play")
        self.addSubview(playImageView)
        
        let mediaInfoLabelRect = self.getMediaInfoLabelFrame(aMessage.isUserSelf)
        mediaInfoLabel = UILabel(frame : mediaInfoLabelRect)
        mediaInfoLabel.backgroundColor = UIColor.clear
        mediaInfoLabel.font = FTDefaultFontSize
        mediaInfoLabel.textColor = UIColor.white
        mediaInfoLabel.textAlignment = aMessage.isUserSelf ? NSTextAlignment.left : NSTextAlignment.right
        mediaInfoLabel.text = "1′ 22″"
        self.addSubview(mediaInfoLabel)
        
    }
    
    fileprivate func getAudioBubblePath(_ size:CGSize , isUserSelf : Bool) -> UIBezierPath {
        let bubbleRect = CGRect(x: isUserSelf ? 0 : FTDefaultMessageBubbleAngleWidth, y: 0, width: size.width - FTDefaultMessageBubbleAngleWidth , height: size.height)
        let path = UIBezierPath.init(roundedRect: bubbleRect, cornerRadius:  size.height/2)
        return path;
    }
    
    fileprivate func getPlayImageViewFrame(_ isUserSelf : Bool) -> CGRect {
        let margin = (FTDefaultMessageBubbleAudioHeight - FTDefaultMessageBubbleAudioIconHeight)/2
        return isUserSelf ?
            CGRect(x: margin, y: margin, width: FTDefaultMessageBubbleAudioIconHeight, height: FTDefaultMessageBubbleAudioIconHeight) :
            CGRect(x: self.frame.size.width - FTDefaultMessageBubbleAudioHeight + margin , y: margin, width: FTDefaultMessageBubbleAudioIconHeight, height: FTDefaultMessageBubbleAudioIconHeight)
        
    }
    fileprivate func getMediaInfoLabelFrame(_ isUserSelf : Bool) -> CGRect {
        let margin = (FTDefaultMessageBubbleAudioHeight - FTDefaultMessageBubbleAudioIconHeight)/2
        return isUserSelf ?
            CGRect(x: FTDefaultMessageBubbleAudioHeight, y: margin, width: self.frame.size.width - FTDefaultMessageBubbleAudioHeight - FTDefaultMessageBubbleAngleWidth - margin, height: FTDefaultMessageBubbleAudioIconHeight) :
            CGRect( x: FTDefaultMessageBubbleAngleWidth + margin, y: margin, width: self.frame.size.width - FTDefaultMessageBubbleAudioHeight - FTDefaultMessageBubbleAngleWidth - margin, height: FTDefaultMessageBubbleAudioIconHeight)
    }
    
}
