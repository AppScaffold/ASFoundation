//
//  Permission+Extension.swift
//  ASFoundation
//
//  Created by jesse on 2019/8/5.
//  Copyright © 2019 jesse. All rights reserved.
//

import Foundation
import PhotosUI

// PHPhotoLibrary Permission Check
extension PHPhotoLibrary {
    @discardableResult
    static func permissionCheck(_ didAuthHandler: ((PHAuthorizationStatus) -> ())? = nil) -> String {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            return "Access is granted by user"
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                // PHAuthorizationStatus.authorized means successfully.
                /* do stuff here upon success*/
                didAuthHandler?(newStatus)
            })
            return "It is not determined until now"
        case .restricted:
            return "User do not have access to photo album."
        case .denied:
            return "User has denied the permission."
        @unknown default:
            #if DEBUG
            fatalError()
            #endif
        }
    }
}
