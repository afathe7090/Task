//
//  TwitterLoginRepo.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import Foundation
import TwitterKit

protocol TwitterLoginRepo {
    func twitterSignInAuthintication() async throws -> TWTRSession
}
