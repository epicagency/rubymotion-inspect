# -*- encoding : utf-8 -*-
class RMISponsorsViewController < UIViewController
  stylesheet :sponsors

  def init
    super.tap do
      self.navigationItem.title = "Our sponsors"
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithImage(
        'menuicon.png'.uiimage,
        style: UIBarButtonItemStylePlain,
        target: self,
        action: "show_menu:"
      )
    end
  end

  def sponsor(tag, url)
    view = subview(UIImageView, tag)
    view.userInteractionEnabled = true
    target = Object.new
    def target.tapped(sender)
      @url.nsurl.open
    end
    target.instance_variable_set(:@url, url)
    tap = UITapGestureRecognizer.alloc.initWithTarget(target, action:'tapped:')
    tap.instance_variable_set(:@__retained_target, target)
    view.addGestureRecognizer(tap)
    view
  end

  layout :root do
    @scroll = subview(UIScrollView, :content) do
      sponsor(:heroku, 'http://heroku.com')
      subview(UIImageView, :hdots1)
      sponsor(:jetbrains, 'http://jetbrains.com')
      subview(UIImageView, :vdots1)
      sponsor(:cyrus, 'http://cyrusinnovation.com')
      subview(UIImageView, :hdots2)
      sponsor(:nedap, 'http://nedap.com')
      subview(UIImageView, :vdots2)
      sponsor(:boxcar, 'http://boxcar.io')
      subview(UIImageView, :hdots3)
      sponsor(:pragmatic, 'http://pragmaticstudio.com')
      subview(UIImageView, :vdots3)
      sponsor(:belighted, 'http://belighted.be')
    end
  end

  def show_menu(sender)
    self.navigationController.slideMenuController.toggleMenuAnimated(self)
  end
  
  def viewDidLayoutSubviews
    @scroll.contentSize = CGSizeMake(320, 650)
  end
end
