# -*- encoding : utf-8 -*-
class RMILocationViewController < UIViewController
  stylesheet :location

  def init
    super.tap do
      self.navigationItem.title = "The location"
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithImage(
        'menuicon.png'.uiimage,
        style: UIBarButtonItemStylePlain,
        target: self,
        action: "show_menu:"
      )
    end
  end

  layout :root do |v|
    @map = subview(MKMapView, :map)
    @map.delegate = self
    @map.zoomEnabled = false
    @map.scrollEnabled = false
    @map.mapType = MKMapTypeHybrid
    @map.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(50.846719, 4.352673), MKCoordinateSpanMake(0.001, 0.001))

    @map_height_constraint = Teacup::Constraint.new(@map, :height).equals(100).nslayoutconstraint
    @map.addConstraint(@map_height_constraint)

    @map_tap = UITapGestureRecognizer.alloc.initWithTarget(self, action: "map_tapped:")
    @map.addGestureRecognizer(@map_tap)

    @open_button = subview(UIButton.custom, :open_button)
    default_image = 'button-ticket-active.png'.uiimage
    @open_button.addConstraint Teacup::Constraint.new(@open_button, :width).equals(default_image.size.width).nslayoutconstraint
    @open_button.addConstraint Teacup::Constraint.new(@open_button, :height).equals(default_image.size.height).nslayoutconstraint
    @open_button_top_constraint = Teacup::Constraint.new(@open_button, :top).equals(@map, :bottom).nslayoutconstraint
    v.addConstraint @open_button_top_constraint

    @open_button.titleLabel.font = 'Arvo'.uifont(11)
    @open_button.setBackgroundImage(default_image, forState: :normal.uicontrolstate)
    @open_button.setTitleColor(UIColor.whiteColor, forState: :normal.uicontrolstate)

    @open_button.on(:touch) do
      self.button_tapped(self)
    end

    subview(UIImageView, :arrow)
    @scroll = subview(UIScrollView, :content) do
      subview(MTLabel, :title)
      subview(UIImageView, :dots)
      subview(UILabel, :description)
    end
  end

  def show_menu(sender)
    self.navigationController.slideMenuController.toggleMenuAnimated(self)
  end

  def mapViewDidFinishLoadingMap(map)
    @pin = MKPointAnnotation.alloc.init
    @pin.coordinate = @map.region.center
    @pin.title = 'Grand-Place'
    @map.addAnnotation @pin
  end

  def mapView(map, viewForAnnotation: annotation)
    MKPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: 'pin')
  end

  def map_tapped(sender)
    UIView.animateWithDuration(0.5, animations: lambda do
      if @map_height_constraint.constant == 100
        @map_height_constraint.constant = 360
        @open_button_top_constraint.constant = -50
      else
        @map_height_constraint.constant = 100
        @open_button_top_constraint.constant = 0
      end
      self.view.setNeedsUpdateConstraints
      self.view.layoutIfNeeded
    end)
  end

  def button_tapped(sender)
    "http://maps.apple.com/?ll=50.846719,4.352673&spn=0.01&q=Grand-Place,%20Brussels,%20Belgium".nsurl.open
  end

  def viewDidLayoutSubviews
    @scroll.contentSize = CGSizeMake(320, 400)
  end
end
