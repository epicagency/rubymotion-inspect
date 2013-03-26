# -*- encoding : utf-8 -*-
class RMIVerticalSwipeScrollView < UIScrollView
  include SugarCube::Timer
  attr_accessor :current_page_index, :datasource

  SCROLL_TRIGGER_HEIGHT = 50
  
  def initWithFrame(frame)
    super.tap do
      self.delegate = self
      @current_page_view = nil
      @previous_page_view = nil
      @next_page_view = nil
      @current_page_index = 0
    end
  end
  
  def datasource=(source)
    @datasource = source
    reload_data
  end
  
  def reload_data
    self.setContentOffset(CGPointZero, animated: false)
    self.subviews.each do |v|
      v.removeFromSuperview
    end
    @previous_page_view = self.datasource.page_at_index(@current_page_index - 1)
    self.addSubview @previous_page_view if @previous_page_view
    @current_page_view = self.datasource.page_at_index(@current_page_index)
    self.addSubview @current_page_view if @current_page_view
    @next_page_view = self.datasource.page_at_index(@current_page_index + 1)
    self.addSubview @next_page_view if @next_page_view
    self.order_and_size_views
  end
  
  def order_and_size_views
    if @current_page_view
      self.sendSubviewToBack @current_page_view
      @current_page_view.frame = CGRectMake(0, 0, contentSize.width, contentSize.height)
    end
    if @next_page_view
      self.bringSubviewToFront @next_page_view
      @next_page_view.frame = CGRectMake(0, contentSize.height, contentSize.width, contentSize.height)
    end
    if @previous_page_view
      self.bringSubviewToFront @previous_page_view
      @previous_page_view.frame = CGRectMake(0, -contentSize.height, contentSize.width, contentSize.height)
    end
  end
  
  def scrollViewDidScroll(scroll_view)
    offset_y = scroll_view.contentOffset.y
    @current_page_view.fix_speaker_image(offset_y)
    return unless scroll_view.dragging?
    
    @goto = :none
    if offset_y < 0
      return unless @previous_page_view
      if offset_y < -SCROLL_TRIGGER_HEIGHT
        @goto = :prev
      end
    else
      return unless @next_page_view
      offset_y -= (scroll_view.contentSize.height - scroll_view.frame.size.height)
      if (offset_y > SCROLL_TRIGGER_HEIGHT)
        @goto = :next
      end
    end
  end
  
  def scrollViewDidEndDragging(scroll_view, willDecelerate: decelerate)
    case @goto
    when :next
      offset_y = scroll_view.contentOffset.y
      scroll_view.bounces = false
      after 1.millisecond do
        scroll_view.setContentOffset(CGPointZero, animated: false)
        @current_page_view.frame = CGRectMake(0, -offset_y, contentSize.width, contentSize.height)
        @current_page_view.fix_speaker_image(offset_y)
        @next_page_view.frame = CGRectMake(0, @next_page_view.frame.origin.y - offset_y, contentSize.width, contentSize.height)
        scroll_view.bounces = true
        UIView.animateWithDuration(0.5, animations: lambda do
          @next_page_view.frame = CGRectMake(0, 0, contentSize.width, contentSize.height)
          @current_page_view.frame = CGRectMake(0, -contentSize.height, contentSize.width, contentSize.height)
        end, completion: lambda do |finished|
          @current_page_index += 1
          @previous_page_view.removeFromSuperview if @previous_page_view
          @previous_page_view = @current_page_view
          @previous_page_view.fix_speaker_image(0)
          @current_page_view = @next_page_view
          @next_page_view = self.datasource.page_at_index(@current_page_index + 1)
          self.addSubview @next_page_view if @next_page_view
          self.order_and_size_views
        end)
      end
    when :prev
      offset_y = scroll_view.contentOffset.y
      scroll_view.bounces = false
      after 1.millisecond do
        scroll_view.setContentOffset(CGPointZero, animated: false)
        @current_page_view.frame = CGRectMake(0, -offset_y, contentSize.width, contentSize.height)
        @current_page_view.fix_speaker_image(offset_y)
        @previous_page_view.frame = CGRectMake(0, @previous_page_view.frame.origin.y - offset_y, contentSize.width, contentSize.height)
        scroll_view.bounces = true
        UIView.animateWithDuration(0.5, animations: lambda do
          @previous_page_view.frame = CGRectMake(0, 0, contentSize.width, contentSize.height)
          @current_page_view.frame = CGRectMake(0, contentSize.height, contentSize.width, contentSize.height)
        end, completion: lambda do |finished|
          @current_page_index -= 1
          @next_page_view.removeFromSuperview if @next_page_view
          @next_page_view = @current_page_view
          @current_page_view = @previous_page_view
          @previous_page_view  = self.datasource.page_at_index(@current_page_index - 1)
          self.addSubview @previous_page_view if @previous_page_view
          self.order_and_size_views
        end)
      end
    end
  end
  
end
