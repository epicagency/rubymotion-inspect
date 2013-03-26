# -*- encoding : utf-8 -*-
class RMIContainerController < UINavigationController
  def initWithRootViewController(root)
    super.tap do

      self.navigationBar.barStyle = UIBarStyleBlack

    end
  end

  def shouldAutorotate
    false
  end
end
