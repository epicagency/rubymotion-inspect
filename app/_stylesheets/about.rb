# -*- encoding : utf-8 -*-
Teacup::Stylesheet.new(:about) do
  style :root,
    backgroundColor: UIColor.whiteColor

  style :content,
    constraints: [:top, :full],
    backgroundColor: UIColor.whiteColor

  rm_image = 'icon-rm.png'.uiimage

  style :rubymotion,
    constraints: [constrain_top(20), :center_x, constrain_size(rm_image.size.width, rm_image.size.height)],
    image: rm_image

  style :title,
    constraints: [:full_width, constrain_below(:rubymotion, 10), :center_x, constrain_height(30)],
    font: 'Cassannet Regular'.uifont(20),
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 1,
    text: '#INSPECT BRUSSELS 2013'

  style :about,
    constraints: [constrain_width(220), constrain_below(:title, 10), :center_x, constrain_height(200)],
    font: 'Arvo'.uifont(11),
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 0,
    text: "A RubyMotion Conference\nwww.rubymotion.com\n\nOrganized by HipByte\ninfo@hipbyte.com\n\nWith the help of:\nMarc Lainez, Stephanie Dijoux, Yannick Schutz\n\nCopyright © HipByte SPRL 2012-2013"

  tw_image = 'icon-twitter-large.png'.uiimage

  style :twitter,
    constraints: [
      :center_x,
      constrain_size(tw_image.size.width, tw_image.size.height),
      constrain_below(:about, 10),
    ],
    image: tw_image

  style :twitter_title,
    constraints: [:full_width, constrain_below(:twitter), :center_x, constrain_height(18)],
    font: 'Cassannet Regular'.uifont(15),
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 1,
    text: 'FOLLOW US'

  style :line,
    constraints: [constrain_below(:twitter_title, 10), constrain_size(220, 1), :center_x],
    backgroundColor: '#c6c6c6'.uicolor

  epic_image = 'icon-epic.png'.uiimage
  style :epic,
    constraints: [
      :center_x,
      constrain_size(130, epic_image.size.height),
      constrain_below(:line, 10),
    ],
    font: 'Cassannet Regular'.uifont(15),
    titleColor: '#808080'.uicolor,
    title: 'made by',
    image: epic_image,
    imageEdgeInsets: UIEdgeInsetsMake(0, 60, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, -130, 0, 0)

end
