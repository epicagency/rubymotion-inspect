# -*- encoding : utf-8 -*-
class RMIMenuViewController < UIViewController
  stylesheet :menu
  attr_accessor :current

  layout :root do
    subview(UIButton.custom, :talks).on(:touch) do
      if self.current != :talks
        self.slideMenuController.setContentViewController(RMITalksController.new, animated: true, completion: nil)
      else
        self.slideMenuController.showContentViewControllerAnimated(true, completion: nil)
      end
      self.current = :talks
    end
    subview(UIButton.custom, :location).on(:touch) do
      if self.current != :location
        self.slideMenuController.setContentViewController(RMIContainerController.alloc.initWithRootViewController(RMILocationViewController.new), animated: true, completion: nil)
      else
        self.slideMenuController.showContentViewControllerAnimated(true, completion: nil)
      end
      self.current = :location
    end
    subview(UIButton.custom, :party).on(:touch) do
      if self.current != :party
        self.slideMenuController.setContentViewController(RMIContainerController.alloc.initWithRootViewController(RMIPartyViewController.new), animated: true, completion: nil)
      else
        self.slideMenuController.showContentViewControllerAnimated(true, completion: nil)
      end
      self.current = :party
    end
    subview(UIView, :header) do
      subview(UILabel, :hash)
      subview(UILabel, :title)
    end

    subview(UIButton.custom, :sponsors).on(:touch) do
      if self.current != :sponsors
        self.slideMenuController.setContentViewController(RMIContainerController.alloc.initWithRootViewController(RMISponsorsViewController.new), animated: true, completion: nil)
      else
        self.slideMenuController.showContentViewControllerAnimated(true, completion: nil)
      end
      self.current = :sponsors
    end
    subview(UIButton.custom, :about).on(:touch) do
      if self.current != :about
        self.slideMenuController.setContentViewController(RMIContainerController.alloc.initWithRootViewController(RMIAboutViewController.new), animated: true, completion: nil)
      else
        self.slideMenuController.showContentViewControllerAnimated(true, completion: nil)
      end
      self.current = :about
    end
  end

  def shouldAutorotate
    false
  end
end
