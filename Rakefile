# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'

Bundler.setup
Bundler.require

Motion::Project::App.setup do |app|
  app.development do
    app.provisioning_profile = ENV['RM_DEV_PROFILE']
    app.codesign_certificate = ENV['RM_DEV_CERTIFICATE']
    app.entitlements['get-task-allow'] = true
  end

  app.release do
    app.provisioning_profile = ENV['RM_PUB_PROFILE']
    app.codesign_certificate = ENV['RM_PUB_CERTIFICATE']
  end

  app.archs['iPhoneOS'] = ['armv7']
  app.deployment_target = "6.0"

  app.name = 'Inspect 2013'

  app.frameworks += %w{MapKit}

  app.identifier = 'net.epic.RubyMotion'
  app.version = app.short_version = "1.0"

  app.pods do
    pod 'NVSlideMenuController'
    pod 'AFNetworking'
  end
  app.vendor_project('vendor/MTLabel', :xcode, target: 'MTLabel', headers_dir: 'MTLabel')

  app.prerendered_icon = true
end
