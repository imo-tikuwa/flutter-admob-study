import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 画面の向きを縦で固定する
  // 参考：https://qiita.com/yamashita_axia-works/items/30b94ed8ac89a561b591
  override func application(
    _ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?
  ) -> UIInterfaceOrientationMask { return UIInterfaceOrientationMask(arrayLiteral:
    [UIInterfaceOrientationMask.allButUpsideDown]);
  }
}
