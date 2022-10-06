//
//  TwitterLoginUseCase.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import Foundation
import TwitterKit


class TwitterLoginUseCase  {
    
    private let repo: TwitterLoginRepo = TwitterLoginRepoImplementaion()
    
    
    func twitterSignInAuthintication() async throws -> TWTRSession{
        return try await repo.twitterSignInAuthintication()
    }
    
}
