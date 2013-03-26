# -*- encoding : utf-8 -*-
class RMIScheduleViewController < UIViewController
  stylesheet :schedule_screen

  def init(schedule)
    super().tap do
      @schedule_name = schedule
      @current_day = 0
      load_data
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithImage(
        'menuicon.png'.uiimage,
        style: UIBarButtonItemStylePlain,
        target: self,
        action: "show_menu:"
      )
      "talks_cached".add_observer(self, :reload_talks)
    end
  end

  layout do
    @table_view = subview(UITableView, :table_view) do |view|
      view.backgroundView = subview(UIView, :table_view_background)
      view.tableFooterView = subview(UIView, :table_view_background)
    end
    @table_view.dataSource = self
    @table_view.delegate = self
    @header_view = subview(RMIScheduleHeaderView, :header_view, {days: @days})
    @header_view.buttons.each do |button|
      button.on(:touch) do
        @header_view.clear_selection
        button.selected = true
        @current_day = button.tag
        @current_schedule = @schedule[@days[@current_day]]
        @table_view.reloadData
        @table_view.scrollToRowAtIndexPath([0, 0].nsindexpath, atScrollPosition: UITableViewScrollPositionTop, animated: true)
      end
    end
    @header_view.buttons.first.selected = true
  end

  def show_menu(sender)
    self.navigationController.slideMenuController.toggleMenuAnimated(self)
  end

  def load_data
    path = "#{@schedule_name}.plist"
    if path.document.exists?
      @schedule = NSMutableDictionary.dictionaryWithContentsOfFile(path.document)
      unless @schedule
        @schedule = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource)
      end
    else
      @schedule = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource)
    end
    @days = @schedule.keys.reverse
    @current_schedule = @schedule[@days[@current_day]]
  end

  def reload_talks
    load_data
    @table_view.reloadData
  end

  def viewDidUnload
    "talks_cached".remove_observer(self)
  end

  #{{{ Table view delegate
  def tableView(table_view, heightForRowAtIndexPath: path)
    i = path.indexAtPosition(1)
    if @current_schedule[i]['type'] == 'break'
      32.0
    else
      80.0
    end
  end

  def tableView(tableView, heightForFooterInSection:section)
     # This will create a "invisible" footer
     return 0.01
  end

  def tableView(table_view, didSelectRowAtIndexPath: path)
    i = path.indexAtPosition(1)
    return if @current_schedule[i]['type'] == 'break'
    speakers = RMISpeakersViewController.new
    speakers.navigationItem.title = "Speakers"
    speakers.start_with = @current_schedule[i]['speaker_index'].to_i
    self.navigationController.pushViewController(
      speakers,
      animated: true
    )
  end
  #}}}

  #{{{ Table view datasource
  def tableView(table_view, cellForRowAtIndexPath: path)
    item = @current_schedule[path.indexAtPosition(1)]
    if item['type'] == 'break'
      cell = table_view.dequeueReusableCellWithIdentifier("schedule_break_cell") || RMIScheduleBreakCellView.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: "schedule_break_cell")
    else
      cell = table_view.dequeueReusableCellWithIdentifier("schedule_speaker_cell") || RMIScheduleSpeakerCellView.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: "schedule_speaker_cell")
    end
    cell.fill(item)
    cell
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @current_schedule.size
  end

  #def tableView(table_view, willDeselectRowAtIndexPath: path)
  #end

  #def tableView(table_view, willSelectRowAtIndexPath: path)
  #end

  def numberOfSectionsInTableView(table_view)
    1
  end
  #}}}
end
