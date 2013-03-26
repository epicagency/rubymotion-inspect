# -*- encoding : utf-8 -*-
Teacup::Stylesheet.new(:menu) do
  style :root,
    gradient: {
      colors: ['#7a7a7a'.uicolor, '#414141'.uicolor]
    }

  style :header,
    backgroundColor: 'background-menu-header.png'.uiimage.uicolor,
    constraints: [
      :top_left,
      :full_width,
      constrain_height(59)
    ]

  style :hash,
    backgroundColor: UIColor.clearColor,
    frame: CGRectMake(20, 16, 20, 25),
    font: 'Arvo-Bold'.uifont(25),
    color: '#f80043'.uicolor,
    text: '#'

  style :title,
    backgroundColor: UIColor.clearColor,
    frame: CGRectMake(40, 16, 190, 25),
    font: 'Arvo-Bold'.uifont(25),
    color: UIColor.whiteColor,
    text: 'INSPECT 2013'

  style :talks,
    backgroundColor: 'background-menu.png'.uiimage.uicolor,
    constraints: [
      :full_width,
      constrain_height(43),
      constrain_below(:header, -4),
    ],
    title: 'TALKS',
    titleFont: 'Cassannet Regular'.uifont(14),
    image: 'icon-talks.png'.uiimage,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    imageEdgeInsets: UIEdgeInsetsMake(0, 14, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, 24, 0, 0)

  style :location,
    backgroundColor: 'background-menu.png'.uiimage.uicolor,
    constraints: [
      :full_width,
      constrain_height(43),
      constrain_below(:talks)
    ],
    title: 'LOCATION',
    titleFont: 'Cassannet Regular'.uifont(14),
    image: 'icon-location.png'.uiimage,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    imageEdgeInsets: UIEdgeInsetsMake(0, 10, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, 20, 0, 0)

  style :party,
    backgroundColor: 'background-menu.png'.uiimage.uicolor,
    constraints: [
      :full_width,
      constrain_height(43),
      constrain_below(:location)
    ],
    title: 'PARTY',
    titleFont: 'Cassannet Regular'.uifont(14),
    image: 'icon-beer.png'.uiimage,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    imageEdgeInsets: UIEdgeInsetsMake(0, 14, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, 28, 0, 0)

  style :sponsors,
    backgroundImage: 'button-menu-ticket.png'.uiimage,
    constraints: [
      :left,
      constrain_width(119),
      constrain_height(36),
      constrain(:bottom).equals(:root, :bottom).minus(90)
    ],
    title: 'Sponsors',
    titleFont: 'Cassannet Regular'.uifont(14),
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentRight,
    titleEdgeInsets: UIEdgeInsetsMake(0, 0, 0, 20)

  style :about,
    backgroundImage: 'button-menu-ticket.png'.uiimage,
    constraints: [
      :left,
      constrain_width(119),
      constrain_height(36),
      constrain(:bottom).equals(:root, :bottom).minus(45)
    ],
    title: 'About',
    titleFont: 'Cassannet Regular'.uifont(14),
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentRight,
    titleEdgeInsets: UIEdgeInsetsMake(0, 0, 0, 20)
end

