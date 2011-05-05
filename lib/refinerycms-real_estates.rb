require 'refinerycms-base'
require File.expand_path('../refinerycms-categories', __FILE__)

module Refinery
  module RealEstates
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "real_estates"
          plugin.activity = {
            :class => RealEstate,
            :title => 'house'
          }
        end
      end
    end
  end
end
