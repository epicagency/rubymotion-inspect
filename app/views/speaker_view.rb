# -*- encoding : utf-8 -*-
class RMISpeakerView < UIView
  attr_reader :speaker_image, :speaker_label, :speaker_company_label, :speaker_description_label, :speaker_twitter, :speaker_www

  def init(speaker)
    initWithFrame(CGRectMake(0, 0, 320, 630)).tap do
      @speaker_image =  UIImageView.alloc.initWithFrame(CGRectMake(0, 0, 320, 336))
      @speaker_image.image = speaker['speaker_image'].uiimage
      self.addSubview @speaker_image
      @content_view = UIView.alloc.initWithFrame(CGRectMake(0, 325, 320, 305))
      @content_view.backgroundColor = UIColor.clearColor
      arrow = UIImageView.alloc.initWithFrame(CGRectMake(0, 0, 320, 18))
      arrow.image = 'speaker-arrow.png'.uiimage
      @content_view.addSubview arrow
      background = UIView.alloc.initWithFrame(CGRectMake(0, 18, 320, 287))
      background.backgroundColor = UIColor.whiteColor
      dots = UIImageView.alloc.initWithFrame(CGRectMake(52, 48, 215, 2))
      dots.image = 'dots.png'.uiimage
      background.addSubview dots
      @speaker_label = UILabel.alloc.initWithFrame(CGRectMake(0, 14, 320, 16))
      @speaker_label.font = 'Cassannet Regular'.uifont(15)
      @speaker_label.text = speaker['name'].upcase
      @speaker_label.textColor = UIColor.blackColor
      @speaker_label.textAlignment = UITextAlignmentCenter
      background.addSubview @speaker_label
      @speaker_company_label = UILabel.alloc.initWithFrame(CGRectMake(0, 37, 320, 15))
      @speaker_company_label.text = speaker['company']
      @speaker_company_label.font = 'Cassannet Regular'.uifont(15)
      @speaker_company_label.textColor = UIColor.blackColor
      @speaker_company_label.textAlignment = UITextAlignmentCenter
      @speaker_company_label.backgroundColor = UIColor.whiteColor
      @speaker_company_label.sizeToFit
      cf = @speaker_company_label.frame
      @speaker_company_label.frame = CGRectMake((320 - cf.size.width) / 2, 37, cf.size.width, cf.size.height)
      background.addSubview @speaker_company_label

      @speaker_description_label = UILabel.alloc.initWithFrame(CGRectMake(52, 65, 216, 150))
      @speaker_description_label.text = speaker['description']
      @speaker_description_label.textColor = UIColor.blackColor
      @speaker_description_label.backgroundColor = UIColor.whiteColor
      @speaker_description_label.numberOfLines = 0
      @speaker_description_label.font = 'Arvo'.uifont(13)
      @speaker_description_label.sizeToFit
      background.addSubview @speaker_description_label

      @speaker_twitter = UIButton.custom
      @speaker_twitter.frame = CGRectMake(79, 220, 42, 42)
      @speaker_twitter.setImage('twitter.png'.uiimage, forState: :normal.uicontrolstate)
      background.addSubview @speaker_twitter

      @speaker_www = UIButton.custom
      @speaker_www.frame = CGRectMake(199, 220, 42, 42)
      @speaker_www.setImage('www.png'.uiimage, forState: :normal.uicontrolstate)
      background.addSubview @speaker_www

      @speaker_twitter.on(:touch) do
        "https://twitter.com/#{speaker['twitter']}".nsurl.open
      end
      @speaker_www.on(:touch) do
        speaker['www'].nsurl.open
      end

      @content_view.addSubview background
      self.addSubview @content_view

    end
  end

  def fix_speaker_image(offset)
    offset = 0 if offset < 0
    f = @speaker_image.frame
    @speaker_image.frame = CGRectMake(0, offset, f.size.width, f.size.height)
  end
end
