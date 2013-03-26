# -*- encoding : utf-8 -*-
Teacup::Stylesheet.new(:schedule_cell) do
  style :content_view,
    gradient: {
      colors: ['#efefef'.uicolor, '#e1e1e1'.uicolor]
    }

  style :time,
    font: 'Arvo-Bold'.uifont(18),
    text: '00:00',
    textColor: '#535353'.uicolor,
    backgroundColor: UIColor.clearColor,
    frame: CGRectMake(0, 0, 80, 32),
    textAlignment: UITextAlignmentCenter

  style :title,
    backgroundColor: UIColor.clearColor,
    font: 'Cassannet Regular'.uifont(14),
    fontColor: '#6a6a6a'.uicolor,
    text: 'Break - Have a cup of coffee',
    frame: CGRectMake(100, 6, 200, 18),
    lineHeight: 14 * 1.1,
    maxNumberOfLines: 2

  style :speaker,
    backgroundColor: UIColor.clearColor,
    font: 'Cassannet Regular'.uifont(14),
    textColor: '#6a6a6a'.uicolor,
    text: 'Laurent Sansonetti'.upcase,
    frame: CGRectMake(135, 47, 165, 10)

  style :speaker_company,
    backgroundColor: UIColor.clearColor,
    font: 'Cassannet Regular'.uifont(12),
    textColor: '#6a6a6a'.uicolor,
    text: 'HipBytes',
    frame: CGRectMake(135, 59, 165, 12)

  style :speaker_image,
    frame: CGRectMake(100, 45, 26, 26)

  style :icon,
    frame: CGRectMake(70, 5, 21, 21),
    image: 'coffee-cup.png'.uiimage

  style :ticket,
    frame: CGRectMake(312, 0, 8, 80),
    image: 'cell-ticket.png'.uiimage

  style :dot,
    frame: CGRectMake(70, 5, 21, 21),
    image: 'dot.png'.uiimage

  style :line,
    frame: CGRectMake(80, 0, 1, 32),
    backgroundColor: '#c6c6c6'.uicolor

  style :line2,
    frame: CGRectMake(80, 0, 1, 80),
    backgroundColor: '#c6c6c6'.uicolor

  style :frame,
    frame: CGRectMake(100, 45, 26, 26),
    image: 'speaker-small-frame.png'.uiimage

end
