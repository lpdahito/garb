$:.unshift File.expand_path('../../lib', __FILE__)
require 'garb'

Garb::Session.login("username", "password")
profile = Garb::Management::Profile.all.detect {|p| p.title == "your_profile_title"}

class PageViews
  extend Garb::Model
  
  metrics :pageviews
  dimensions :page_path
end

profile.page_views.each do |result|
  puts "#{result.page_path} #{result.pageviews}"
end