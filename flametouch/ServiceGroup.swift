//
//  ServiceGroup.swift
//  flametouch
//
//  Created by tominsam on 2/27/16.
//  Copyright © 2016 tominsam. All rights reserved.
//

import UIKit

class ServiceGroup: NSObject {

    var services = [NetService]()
    var addresses = [String]()

    init(service : NetService, address : String) {
        super.init()
        services.append(service)
        sortServices()
        addresses.append(address)
        sortAddresses()
    }

    func addService(_ service : NetService) {
        services.append(service)
        sortServices()
    }

    private func sortServices() {
        services.sort { $0.type.lowercased() < $1.type.lowercased() }
    }

    func addAddress(_ address : String) {
        if addresses.contains(address) {
            return
        }
        addresses.append(address)
        sortAddresses()
    }

    private func sortAddresses() {
        addresses.sort { $0.count < $1.count || $0 < $1 }
    }

    var title : String {
        get {
            return ServiceName.nameForServiceGroup(self)
        }
    }

    var address : String {
        get {
            return addresses.first ?? "."
        }
    }

    var subTitle : String {
        get {
            if services.count > 1 {
                return "\(address) (\(services.count) services)"
            } else {
                return "\(address) (One service)"
            }
        }
    }

    override var description : String {
        get {
            return "<ServiceGroup \(title) \(addresses) (\(services))>"
        }
    }

}
