//
//  MLNDevice.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice

///
/// A class that implements the iOS / iPadOS device specification.
///
@available(iOS 15.0, *)
public final class MLNDevice: MLNDeviceSpecificationable {

    // MARK: - Static properties

    ///
    /// A shared property that allows access to the properties of a class that implements the MLNDeviceSpecificationable protocol.
    ///
    public static let current: MLNDeviceSpecificationable = MLNDevice()



    // MARK: - Public properties

    ///
    /// A property that allows you to get information about the current device.
    ///
    public var device: Device {
        guard let deviceName else {
            return .init()
        }

        let deviceType = deviceModelID
            .replacingOccurrences(of: ",", with: "")
            .components(separatedBy: .decimalDigits)
            .joined()

        let type: Device.`Type`

        switch deviceType {
        case "iPod":
            type = .iPod
        case "iPhone":
            type = .iPhone
        case "iPad":
            type = .iPad
        default:
            type = .unknown
        }

        let model: Device.Model

        switch type {
        case .iPod:
            model = .iPod_touch
        case .iPhone:
            model = .iPhone
        case .iPad:
            model = .iPad
        case .unknown:
            model = .unknown
        }

        let name = deviceName
            .replacingOccurrences(of: " | Cellular", with: "")

        let device = Device(
            type: type,
            model: model,
            name: .init(rawValue: name) ?? .undefined
        )

        return device
    }

    ///
    /// A property that allows you to get information about the current version of the operating system.
    ///
    public var operatingSystem: OperatingSystem {
        guard let _ = deviceName else {
            return .init()
        }

        let type: OperatingSystem.`Type`
        let name: OperatingSystem.Name

        switch device.type {
        case .iPod, .iPhone:
            type = .mobile

            name = .iOS
        case .iPad:
            type = .mobile

            name = .iPadOS
        case .unknown:
            type = .unknown

            name = .undefined
        }

        let fullname: String
        let version: OperatingSystem.Version

        let process = ProcessInfo()

        let majorVersion = UInt16(process.operatingSystemVersion.majorVersion)
        let minorVersion = UInt16(process.operatingSystemVersion.minorVersion)
        let patchVersion = UInt16(process.operatingSystemVersion.patchVersion)

        switch device.type {
        case .iPod, .iPhone, .iPad:
            fullname = "\(name) \(majorVersion).\(minorVersion).\(patchVersion)"

            version = .init(
                major: majorVersion,
                minor: minorVersion,
                patch: patchVersion
            )
        case .unknown:
            fullname = ""

            version = .init()
        }

        let operatingSystem = OperatingSystem(
            type: type,
            name: name,
            fullname: fullname,
            version: version
        )

        return operatingSystem
    }

    ///
    /// A property that allows you to get information about the current device software.
    ///
    public var software: Software {
        guard let _ = deviceName else {
            return .init()
        }

        let isSimulatorEnvironment: Bool
#if targetEnvironment(simulator)
        isSimulatorEnvironment = true
#else
        isSimulatorEnvironment = true
#endif

        let process = ProcessInfo()

        let isLowPowerModeEnabled = process.isLowPowerModeEnabled

        let software = Software(
            type: .iOS,
            isSimulatorEnvironment: isSimulatorEnvironment,
            isLowPowerModeEnabled: isLowPowerModeEnabled
        )

        return software
    }

    ///
    /// A property that allows you to get information about the current hardware of the device.
    ///
    public var hardware: Hardware {
        guard let deviceName else {
            return .init()
        }

        let bluetooth: Hardware.SensorAvailability = .available

        let iBeacon: Hardware.SensorAvailability = .available

        let accelerometer: Hardware.SensorAvailability = .available
        let barometer: Hardware.SensorAvailability = .available
        let gyroscope: Hardware.SensorAvailability = .available
        let magnetometer: Hardware.SensorAvailability = .available

        let wifi: Hardware.SensorAvailability = .available

        let gps: Hardware.SensorAvailability
        let cellular: Hardware.SensorAvailability

        switch device.type {
        case .iPod, .unknown:
            gps = .unavailable

            cellular = .unavailable
        case .iPhone:
            gps = .available

            cellular = .available
        case .iPad:
            let state = deviceName.contains("Cellular")

            gps = state ? .available : .unavailable

            cellular = state ? .available : .unavailable
        }

        let hardware = Hardware(
            connectivity: .init(
                gps: gps,
                iBeacon: iBeacon,
                bluetooth: bluetooth
            ),
            imu: .init(
                accelerometer: accelerometer,
                barometer: barometer,
                gyroscope: gyroscope,
                magnetometer: magnetometer
            ),
            network: .init(
                cellular: cellular,
                wifi: wifi
            )
        )

        return hardware
    }

    ///
    /// A property that allows you to get the full specification of the current device.
    ///
    public var specification: Specification {
        .init(
            device: device,
            operatingSystem: operatingSystem,
            software: software,
            hardware: hardware
        )
    }



    // MARK: - Private properties

    private let deviceModelID: String = {
        let process = ProcessInfo()

#if targetEnvironment(simulator)
        guard let simulatorModelID = process.environment["SIMULATOR_MODEL_IDENTIFIER"] else {
            return ""
        }

        return simulatorModelID
#elseif os(iOS)
        var systemInfo = utsname()
        uname(&systemInfo)

        return .init(
            bytes: Data(
                bytes: &systemInfo.machine,
                count: Int(_SYS_NAMELEN)
            ),
            encoding: .ascii
        )!
            .trimmingCharacters(in: .controlCharacters)
#endif
    }()

    private lazy var deviceName: String? = {
        DeviceList().devices[deviceModelID]
    }()



    // MARK: - Init

    private init() { }
}
