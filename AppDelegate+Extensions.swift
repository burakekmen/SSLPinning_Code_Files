extension AppDelegate {
 func setupTrustKitSSLPinning() {
 TrustKit.setLoggerBlock { (message) in
 print(“TrustKit log: \(message)”)
 }
 let trustKitConfig: [String: Any] = [
 kTSKSwizzleNetworkDelegates: false,
 kTSKPinnedDomains: [
 “google.com”: [
 kTSKEnforcePinning: true,
 kTSKIncludeSubdomains: true,
 kTSKPublicKeyHashes: [
 // Pem dosyasından aldığınız Public Key değeri
 “Z7iX8iPL/tb+En3S+O8dX8VWg/fn/BYJGWopTO3cNqU=”,
 // Yukarıdaki Public Key geçersiz olursa diye
 “ABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABC=”
 ],
 kTSKReportUris: [“https://overmind.datatheorem.com/trustkit/report”],
 ]
 ]]
 TrustKit.initSharedInstance(withConfiguration: trustKitConfig)
 }
} 