# -*- encoding : utf-8 -*-
class RMITalksController < UINavigationController
  def init
    super.tap do

      self.navigationBar.barStyle = UIBarStyleBlack

      controller = RMIScheduleViewController.alloc.init(:talks)
      controller.navigationItem.title = "Talks"
      self.setViewControllers([controller], animated: false)

    end
  end

  def shouldAutorotate
    false
  end
end
