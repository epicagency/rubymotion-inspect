# -*- encoding : utf-8 -*-
class RMIScheduleHeaderView < UIView
  attr_reader :buttons

  def initWithFrame(frame)
    super.tap do
      img = 'schedule_header.png'.uiimage
      subview(UIImageView, {image: img, frame: CGRectMake(0, 0, img.size.width, img.size.height)})
    end
  end
  
  def clear_selection
    @buttons.each {|button| button.selected = false }
  end
  
  def days=(days)
    @days = days
    if @buttons
      @buttons.each do |b|
        b.removeFromSuperview
      end
    end
    @buttons = []
    default_image = 'button-ticket.png'.uiimage
    active_image = 'button-ticket-active.png'.uiimage
    w = default_image.size.width
    h = default_image.size.height
    offset = (320 - (@days.size * w)) / (@days.size + 1)
    
    @days.each_with_index do |day, i|
      title = "DAY #{i+1} • #{day[1..-1]}TH"
      button = subview(UIButton.custom, {
        frame: CGRectMake(((i+1) * offset) + (i * w), 20, w, h),
        tag: i
      })
      button.titleLabel.font = 'Arvo'.uifont(11)
      button.setTitle(title, forState: :normal.uicontrolstate)
      button.setBackgroundImage(default_image, forState: :normal.uicontrolstate)
      button.setTitleColor(UIColor.blackColor, forState: :normal.uicontrolstate)
      button.setTitle(title, forState: :selected.uicontrolstate)
      button.setBackgroundImage(active_image, forState: :selected.uicontrolstate)
      button.setTitleColor(UIColor.whiteColor, forState: :selected.uicontrolstate)
      @buttons << button
    end
  end
end
