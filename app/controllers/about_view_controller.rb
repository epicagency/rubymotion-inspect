# -*- encoding : utf-8 -*-
class RMIAboutViewController < UIViewController
  stylesheet :about

  def init
    super.tap do
      self.navigationItem.title = "About"
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithImage(
        'menuicon.png'.uiimage,
        style: UIBarButtonItemStylePlain,
        target: self,
        action: "show_menu:"
      )
    end
  end


  layout :root do
    @scroll = subview(UIScrollView, :content) do
      subview(UIImageView, :rubymotion)
      subview(UILabel, :title)
      subview(UILabel, :about)
      subview(UIButton.custom, :twitter).on(:touch) do
        self.open_twitter
      end
      subview(UILabel, :twitter_title)
      subview(UIView, :line)
      subview(UIButton.custom, :epic).on(:touch) do
        self.open_epic
      end
    end
  end
  def show_menu(sender)
    self.navigationController.slideMenuController.toggleMenuAnimated(self)
  end

  def viewDidLayoutSubviews
    @scroll.contentSize = CGSizeMake(320, 500)
  end

  def open_twitter
    "https://twitter.com/RubyMotion".nsurl.open
  end

  def open_epic
    "http://epic.net".nsurl.open
  end
end
