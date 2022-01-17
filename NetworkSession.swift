import Alamofire
import Foundation
import TrustKit
 
class NetworkSession: SessionDelegate {
 
static let sharedSession = Session(delegate: NetworkSession())
    
    override func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if TrustKit.sharedInstance().pinningValidator.handle(challenge, completionHandler: completionHandler) == false {
                    completionHandler(.cancelAuthenticationChallenge, nil)
                }
    }
}
