//
//  Sandbox.playground
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


/*
 *  This is a place to test hypotheses, implement test services and framework functionality
 *  to test its operation with their long-term implementation of *.swift files.
 */


// MARK: Import section

import Foundation



// MARK: - Helpers

@available(iOS 15.0, *)
public typealias MLNObject = AnyObject & CustomStringConvertible

@available(iOS 15.0, *)
public protocol MLNServiceable: MLNObject { }

extension MLNServiceable {
    public var description: String {
        "This class supports Dependency Injection and can be registered via MLNServiceContainer"
    }
}



// MARK: - Implementable Service













// TODO: - Create -

// 1. IoC -> DI ✅
// 2. Navigation ❌ -> Coordinator ❌ / Deeplink Manager ❌
// 3. Push Notifications ❌ -> Local Push Notification ❌ / Remote Push Notification ❌
// 5. Device Specification ❌
// 6. Live Preview ❌
// 7. Logger ❌
// 8. Project Specifications ❌ -> App Specification ❌ / Framework Specification ❌
// 9. Data Storage ❌ -> Caching Storage ❌ / Default Storage ❌ / File Storage / Keychain Storage ❌
// 10. Haptic Feedbacks ✅ -> Haptic Feedback ✅
// 11. Media Engines ❌ -> Video Engine ❌
// 12. Network Interaction ❌ -> Network Configuration ❌ / Network Manager ❌
// 13. Setting up MelonKit repo
