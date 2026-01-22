import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Экран, на который будут накладываться другие UIView элементы
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        // Для назначения этого window главным
        window?.makeKeyAndVisible()
        // Установка главного контроллера, с которого начнется работа приложения
        window?.rootViewController = ViewController()
        return true
    }
}
