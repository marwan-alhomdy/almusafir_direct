import UIKit
import Flutter
import Firebase
import GoogleMaps
import FirebaseCore
import FirebaseMessaging

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GMSServices.provideAPIKey("")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   override func application(
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable: Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    Messaging.messaging().appDidReceiveMessage(userInfo)
    completionHandler(UIBackgroundFetchResult.newData)
  }
   
    override func application(
     _ application: UIApplication,
     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
         
     Messaging.messaging().apnsToken = deviceToken
     print("token: \(deviceToken)")
     super.application(application,
     didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
     
     
   }
}
