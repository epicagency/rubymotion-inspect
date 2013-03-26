# -*- encoding : utf-8 -*-
Teacup.handler UIButton, :image do |view, image|
  view.setImage(image, forState: :normal.uicontrolstate)
end

Teacup.handler UIButton, :backgroundImage do |view, image|
  view.setBackgroundImage(image, forState: :normal.uicontrolstate)
end

