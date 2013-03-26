# -*- encoding : utf-8 -*-
class RMIScheduleSpeakerCellView < UITableViewCell

  attr_reader :time_label, :title_label, :speaker_label, :speaker_company_label, :speaker_image

  def initWithStyle(style, reuseIdentifier: identifier)
    super.tap do
      #selectionStyle = UITableViewCellSelectionStyleNone

      self.contentView.stylesheet = Teacup::Stylesheet[:schedule_cell]
      layout(self.contentView, :content_view) do
        subview(UIView, :line2)
        @dot = subview(UIImageView, :dot)
        subview(UIImageView, :ticket)
        @time_label = subview(UILabel, :time)
        @title_label = subview(MTLabel, :title)
        @title_label.limitToNumberOfLines = true
        @title_label.resizeToFitText = true
        @speaker_label = subview(UILabel, :speaker)
        @speaker_company_label = subview(UILabel, :speaker_company)
        @speaker_image = subview(UIImageView, :speaker_image)
        subview(UIImageView, :frame)
      end
    end
  end

  def fill(item)
    @time_label.text = item['time']
    @title_label.text = item['title']
    @speaker_label.text = item['speaker']
    @speaker_company_label.text = item['speaker_company']
    @speaker_image.image = item['speaker_image'].uiimage.rounded(3)
  end

  def layoutSubviews
    super
    self.contentView.layer.sublayers[0].frame = self.contentView.bounds
    f = @title_label.frame
    h = self.class.title_height(@title_label.text, f.size.width)
    f = CGRectMake(f.origin.x, 6 + ((36 - h) / 2), f.size.width, h)
    @title_label.frame = f
    f = @dot.frame
    f = CGRectMake(f.origin.x, 5 + ((36 - h) / 2), f.size.width, f.size.height)
    @dot.frame = f
  end

  def self.title_height(title, width)
    @font ||= 'Cassannet Regular'.uifont(14)
    c = CGSizeMake(width, 36)
    s = title.sizeWithFont(@font, constrainedToSize: c)
    s.height
  end

end
