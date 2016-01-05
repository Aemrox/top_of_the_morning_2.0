require "./config/environment"
require "sinatra/activerecord/rake"

task :console do
  Pry.start
end

task :update_stories do #force updates stories without checking time since last story
  Channel.all.each do |channel|
    if channel.basic
      story_params = channel.site.scrape
    else #if it is not a basic channel, it must pass a modifier, which is it's downcased name
      story_params = channel.site.scrape(channel.modifier)
    end
    new_story = Story.new(story_params)
    new_story.channel = channel
    new_story.save
    new_story
  end
end

task :show_sites do
  Site.all.each do |site|
    puts site
  end
end

task :show_channel_sites do
  Channel.all.each do |channel|
    puts channel.name
    puts channel.site
    if channel.site.name
      puts channel.site.name
    else
      puts channel.name + " has an issue"
    end
  end
end

task :clear_db_and_models do
  Channel.destroy_all
  Site.destroy_all
  Story.destroy_all
  User.destroy_all
end
