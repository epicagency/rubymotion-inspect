# -*- encoding : utf-8 -*-
class RMISpeakersViewController < UIViewController
  attr_accessor :start_with

  def init
    super.tap do
      @speakers = NSMutableArray.arrayWithContentsOfFile("speakers.plist".resource)
      @start_with = 0
    end
  end

  def loadView
    self.view = RMIVerticalSwipeScrollView.alloc.initWithFrame(
      CGRectMake(0, 0, 320, 460)
    )
    self.view.current_page_index = @start_with
    self.view.contentSize = CGSizeMake(320, 630)
    self.view.datasource = self
  end

  def page_at_index(index)
    return if index < 0 || index >= @speakers.length
    RMISpeakerView.alloc.init(@speakers[index])
  end

end
