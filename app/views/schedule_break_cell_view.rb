# -*- encoding : utf-8 -*-
class RMIScheduleBreakCellView < UITableViewCell

  attr_reader :time_label, :title_label, :break_icon

  def initWithStyle(style, reuseIdentifier: identifier)
    super.tap do
      selectionStyle = UITableViewCellSelectionStyleNone

      self.contentView.stylesheet = Teacup::Stylesheet[:schedule_cell]
      layout(self.contentView, :content_view) do
        subview(UIView, :line)
        @time_label = subview(UILabel, :time)
        @title_label = subview(MTLabel, :title)
        @break_icon = subview(UIImageView, :icon)
      end
    end
  end

  def fill(item)
    @time_label.text = item['time']
    @title_label.text = item['title']
    @break_icon.image = item['icon'].uiimage
  end

  def layoutSubviews
    super
    self.contentView.layer.sublayers[0].frame = self.contentView.bounds
  end
end
