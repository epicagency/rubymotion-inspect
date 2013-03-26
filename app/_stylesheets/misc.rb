# -*- encoding : utf-8 -*-
Teacup::Stylesheet.new(:location) do
  style :root,
    backgroundColor: UIColor.whiteColor

  style :map,
    constraints: [:top, :full_width]

  style :arrow,
    constraints: [:full_width, constrain_height(18), constrain_below(:map).minus(18)],
    image: 'speaker-arrow.png'.uiimage

  style :open_button,
    constraints: [:center_x],
    title: 'Open in Map'

  style :content,
    constraints: [constrain_below(:arrow), :full_width, constrain(:height).equals(:root, :height).minus(100)],
    backgroundColor: UIColor.whiteColor

  style :title,
    constraints: [constrain_width(220), :top, :center_x, constrain_height(25)],
    font: 'Cassannet Regular'.uifont(20),
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 0,
    lineHeight: 20,
    text: 'Grand-Place, Brussels'

  style :dots,
    constraints: [constrain_width(220), constrain_below(:title, 10), :center_x, constrain_height(2)],
    image: 'dots.png'.uiimage

  style :description,
    constraints: [constrain_width(220), constrain_below(:dots, 10), :center_x, constrain_height(224)],
    font: 'Arvo'.uifont(11),
    numberOfLines: 0,
    text: "The conference will be held in an elegant “Maison de Maitre” located right on Brussels' historical square, the Grand-Place.\n\nAs a UNESCO World Heritage Site, the Grand-Place is one of the most beautiful squares of the world, and is also the center of the city, surrounded by hotels, restaurants and bars.\n\nTraditional Belgian food and beverages will be served on-site."

  style :title2,
    constraints: [constrain_width(220), :top, :center_x, constrain_height(25)],
    font: 'Cassannet Regular'.uifont(20),
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 0,
    lineHeight: 20,
    text: "Délirium Café"

  style :dots2,
    constraints: [constrain_width(220), constrain_below(:title2, 10), :center_x, constrain_height(2)],
    image: 'dots.png'.uiimage

  style :description2,
    constraints: [constrain_width(220), constrain_below(:dots2, 10), :center_x, constrain_height(235)],
    font: 'Arvo'.uifont(11),
    numberOfLines: 0,
    text: "On Friday night you are invited to an awesome after-party at the Délirium Café.\n\nThe Délirium is known for its long beer list, standing at 2,004 different brands in January 2004 as recorded in the The Guinness Book of Records.\n\nThe bar is located in the small alley called Impasse de la Fidélité, only a couple of hundred metres from the Grand-Place. Don't miss the Jeanneke Pis statue nearby!"
end

Teacup::Stylesheet.new(:sponsors) do
  style :root,
    backgroundColor: UIColor.whiteColor

  style :content,
    constraints: [:top, :full]

  style :heroku,
    constraints: [:top, :center_x, constrain_size(200, 144)],
    image: 'sponsors/heroku.png'.uiimage

  grey_dots = 'grey_dots.png'.uiimage
  vgrey_dots = 'vgrey_dots.png'.uiimage
  vgrey_dots_110 = 'vgrey_dots_110.png'.uiimage

  style :hdots1,
    constraints: [constrain_below(:heroku), :center_x, constrain_size(262, 2)],
    image: grey_dots

  style :jetbrains,
    constraints: [constrain(:left).equals(:content, :left).plus(25), constrain_below(:hdots1, 5), constrain_size(122, 144)],
    image: 'sponsors/jetbrains.png'.uiimage

  style :vdots1,
    constraints: [constrain_below(:hdots1, 5), :center_x, constrain_size(2, 142)],
    image: vgrey_dots

  style :cyrus,
    constraints: [constrain(:left).equals(:content, :left).plus(172), constrain_below(:hdots1, 5), constrain_size(122, 144) ],
    image: 'sponsors/cyrus-innovation.png'.uiimage

  style :hdots2,
    constraints: [constrain_below(:jetbrains, 5), :center_x, constrain_size(262, 2)],
    image: grey_dots

  style :nedap,
    constraints: [constrain(:left).equals(:content, :left).plus(25), constrain_below(:hdots2, 5), constrain_size(122, 144)],
    image: 'sponsors/nedap.png'.uiimage

  style :vdots2,
    constraints: [constrain_below(:hdots2, 5), :center_x, constrain_size(2, 142)],
    image: vgrey_dots

  style :boxcar,
    constraints: [constrain(:left).equals(:content, :left).plus(172), constrain_below(:hdots2, 5), constrain_size(122, 144) ],
    image: 'sponsors/boxcar.png'.uiimage

  style :hdots3,
    constraints: [constrain_below(:nedap, 5), :center_x, constrain_size(262, 2)],
    image: grey_dots

  style :pragmatic,
    constraints: [constrain(:left).equals(:content, :left).plus(45), constrain_below(:hdots3, 5), constrain_size(92, 110) ],
    image: 'sponsors/pragmatic-studio.png'.uiimage

  style :vdots3,
    constraints: [constrain_below(:hdots3, 5), :center_x, constrain_size(2, 110)],
    image: vgrey_dots_110

  style :belighted,
    constraints: [constrain(:left).equals(:content, :left).plus(182), constrain_below(:hdots3, 5), constrain_size(92, 110) ],
    image: 'sponsors/belighted.png'.uiimage
end
