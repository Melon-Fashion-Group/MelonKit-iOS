//
//  MLNLogger.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import OSLog



// MARK: - MLNLogger

///
///
///
@available(iOS 15.0, *)
public final class MLNLogger: MLNLoggable {

    // MARK: - Private properties

    private let logger: Logger = {
        let subsystem = Bundle.main.bundleIdentifier ?? ""
        let category = String(describing: MLNLogger.self)

        return .init(subsystem: subsystem, category: category)
    }()

    private let currentDevice: MLNDeviceSpecificationable = MLNDevice.current

    private let calendar = Calendar.current



    // MARK: - Init

    ///
    ///
    ///
    public init() { }

    ///
    ///
    ///
    @discardableResult
    public init(
        type: LogType = .debug,
        file: String = #file,
        line: UInt16 = #line,
        _ log: () -> Log
    ) {
        let log = log()

        let message = if let description = log.description { "\(log.message) - \(description)" } else { log.message }

        let section = type.rawValue.uppercased()

        let deviceInfo = getDeviceInfo()
        let fileInfo = getFileInfo(file: file, line: line)
        let dateInfo = getDateInfo()

        printLog(message, for: type, in: section, deviceInfo: deviceInfo, dateInfo: dateInfo, fileInfo: fileInfo)
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func log(
        type: LogType = .debug,
        file: String = #file,
        line: UInt16 = #line,
        _ log: () -> Log
    ) {
        let log = log()

        let message = if let description = log.description { "\(log.message) - \(description)" } else { log.message }

        let section = type.rawValue.uppercased()

        let deviceInfo = getDeviceInfo()
        let fileInfo = getFileInfo(file: file, line: line)
        let dateInfo = getDateInfo()

        printLog(message, for: type, in: section, deviceInfo: deviceInfo, dateInfo: dateInfo, fileInfo: fileInfo)
    }



    // MARK: - Private functions

    private func getDeviceInfo() -> String {
        let deviceName = currentDevice.device.name.rawValue
        let osName = currentDevice.operatingSystem.fullname

        return "Device: \(deviceName) · OS: \(osName)"
    }

    private func getFileInfo(file: String, line: UInt16) -> String {
        let components = file.components(separatedBy: "/")
        let filename = if let lastComponent = components.last { "\(lastComponent)" } else { "" }

        return "File: \(filename) · Line: \(line)"
    }

    private func getDateInfo() -> String {
        let date = getDate()
        let time = getTime()

        return "\(date) · \(time)"
    }

    private func getDate() -> String {
        let date = Date()

        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)

        return "Date: \(day).\(month).\(year)"
    }

    private func getTime() -> String {
        let date = Date()

        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)

        let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
        let secondString = second < 10 ? "0\(second)" : "\(second)"

        return "Time: \(hourString):\(minuteString):\(secondString)"
    }

    private func printLog(
        _ message: String,
        for type: LogType,
        in section: String,
        deviceInfo: String,
        dateInfo: String,
        fileInfo: String
    ) {
        switch type {
        case .debug:
            logger.debug("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        case .error:
            logger.error("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        case .info:
            logger.info("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        case .warning:
            logger.warning("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        case .trace:
            logger.trace("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        case .notice:
            logger.notice("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        case .critical:
            logger.critical("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        case .fault:
            logger.fault("[\(section)]: \(message) | \(deviceInfo) | \(dateInfo) | \(fileInfo)")
        }
    }
}
