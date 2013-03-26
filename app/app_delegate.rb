# -*- encoding : utf-8 -*-
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    menu = RMIMenuViewController.new
    menu.current = :talks
    talks = RMITalksController.new

    UINavigationBar.appearance.titleTextAttributes = { UITextAttributeFont => 'Cassannet Regular'.uifont(20) }

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    root = NVSlideMenuController.alloc.initWithMenuViewController(menu, andContentViewController: talks)
    #root.panGestureEnabled = false
    @window.rootViewController = root
    @window.makeKeyAndVisible
    true
  end

  def applicationDidBecomeActive(application)
    cache_talks
  end

  def cache_talks
    AFMotion::HTTP.get("http://rubymotion.com/conference/talks.plist", q: Time.now.to_i) do |result|
      if result && result.body
        path = "talks.plist".document
        path.remove! if path.exists?
        NSFileManager.defaultManager.createFileAtPath(path, contents: result.body, attributes: nil)
        "talks_cached".post_notification
      end
    end
  end
end
