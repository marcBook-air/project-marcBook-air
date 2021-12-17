//
//  iCloudConnect.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 17/12/2021.
//

import SwiftUI
import CloudKit
class iCloudConnectViewModel: ObservableObject {
    
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""

    init() {
        getiCloudStatus()
    }
    
        private func getiCloudStatus() {
            CKContainer.default().accountStatus { [weak self] returnStatus, returnError in
                DispatchQueue.main.async {
                    switch returnStatus {
                    case .couldNotDetermine:
                        self?.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                    case .available:
                        self?.isSignedInToiCloud = true
                    case .restricted:
                        self?.error = CloudKitError.iCloudAccountRestricted.rawValue
                    case .noAccount:
                        self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                    case .temporarilyUnavailable:
                        self?.error = CloudKitError.iCloudAccountTemporarilyUnavailable.rawValue
                    default:
                        break
                }
            }
        }
    }
    
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
        case iCloudAccountTemporarilyUnavailable
    }
}

struct iCloudConnect: View {
    
    @StateObject private var vm = iCloudConnectViewModel()
    
    var body: some View {
        VStack {
            Text("IS SIGNED IN: \(vm.isSignedInToiCloud.description.uppercased())")
            Text(vm.error)
        }
    }
}

struct iCloudConnect_Previews: PreviewProvider {
    static var previews: some View {
        iCloudConnect()
    }
}
