//
//  PermissionService.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 10.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import Foundation
import CoreLocation
import AVFoundation
import Photos
import EventKit
import Contacts
import NotificationCenter

public enum LocationRequestType {
    case whenInUse
    case always
}

public class PermissionService: NSObject, CLLocationManagerDelegate {
    // MARK: - Private Properties

    private var locationManager: CLLocationManager?
    private var locationRequestCompletion: ((CLAuthorizationStatus) -> Void)?

    // MARK: - Public Methods

    /// Will ask for camera permission
    /// Don't forget to set *NSCameraUsageDescription* key in your Info.plist
    public func requestCameraPermission(completion: ((AVAuthorizationStatus) -> Void)?) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        guard status != .notDetermined else {
            completion?(status)
            return
        }

        AVCaptureDevice.requestAccess(for: .video) { _ in
            completion?(AVCaptureDevice.authorizationStatus(for: .video))
        }
    }

    /// Will ask for photo library permission
    /// Don't forget to set *NSPhotoLibraryUsageDescription* key in your Info.plist
    public func requestPhotoLibraryPermission(completion: @escaping (PHAuthorizationStatus) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        guard status != .notDetermined else {
            completion(status)
            return
        }

        PHPhotoLibrary.requestAuthorization(completion)
    }

    /// Will ask for photo library permission
    /// Don't forget to set *NSMicrophoneUsageDescription* key in your Info.plist
    public func requestMicrophonePermission(completion: @escaping (Bool) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission(completion)
    }

    /// Will show dialog for photo library permission
    /// Don't forget to set *NSLocationWhenInUseUsageDescription* or *NSLocationAlwaysUsageDescription* or *NSLocationAlwaysAndWhenInUseUsageDescription* key in your Info.plist
    public func requestLocationPermission(for type: LocationRequestType, completion: @escaping (CLAuthorizationStatus) -> Void) {
        locationRequestCompletion = completion

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        if type == .whenInUse {
            locationManager?.requestWhenInUseAuthorization()
        }
        else {
            locationManager?.requestAlwaysAuthorization()
        }
    }

    /// Will ask for calendar permission
    /// Don't forget to set *NSCalendarsUsageDescription* key in your Info.plist
    public func requestCalendarPermission(completion: @escaping (Bool, Error?) -> Void) {
        EKEventStore().requestAccess(to: .event, completion: completion)
    }

    /// Will ask for reminders permission
    /// Don't forget to set *NSRemindersUsageDescription* key in your Info.plist
    public func requestReminderPermission(completion: @escaping (Bool, Error?) -> Void) {
        EKEventStore().requestAccess(to: .reminder, completion: completion)
    }

    /// Will ask for notifications permission
    public func requestNotificationPermission(with options: UNAuthorizationOptions, completion: @escaping (Bool, Error?) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: options, completionHandler: completion)
    }

    /// Will ask for contacts permission
    /// Don't forget to set *NSContactsUsageDescription* key in your Info.plist
    public func requestContactsPermission(completion: @escaping (CNAuthorizationStatus) -> Void) {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        guard status != .notDetermined else {
            completion(status)
            return
        }

        CNContactStore().requestAccess(for: .contacts) { _, _ in
            completion(CNContactStore.authorizationStatus(for: .contacts))
        }
    }

    // MARK: - Delegates

    // MARK: CLLocationManager

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationRequestCompletion?(status)

        locationRequestCompletion = nil
        locationManager?.delegate = nil
        locationManager = nil
    }
}
