//
//  TwitterLoginRepoImplementaion.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import Foundation
import TwitterKit


class TwitterLoginRepoImplementaion: TwitterLoginRepo {
    
    func twitterSignInAuthintication() async throws -> TWTRSession {
        return try await withCheckedThrowingContinuation({ continuation in
            DispatchQueue.main.async {
                TWTRTwitter.sharedInstance().logIn(completion: {(session ,error ) in
                    if let error = error  {
                        continuation.resume(throwing: error)
                    }
                    
                    if let session = session {
                        continuation.resume(returning: session)
                    }
                })
            }
        })
    }

    
}
