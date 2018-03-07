require 'thor'
require 'json'

module AmusingGit
  class CLI < Thor
    desc "start", "Start amusing for the current git repository"
    def start
    end

    desc "stop", "Stop amusing for the current git repository"
    def stop
    end

    desc "setup", "Setup amusing git"
    def setup
      return if File.exists? "#{ENV['HOME']}/.amusing_git"

      config = {
        "messages" => "#{ENV['HOME']}/.amusing_git/default_messages"
      }

      `mkdir #{ENV['HOME']}/.amusing_git`

      config_file = File.new("#{ENV['HOME']}/.amusing_git/config", "w")

      File.open(config_file, "w") do |f|
        f.write(JSON.pretty_generate(config))
      end

      `cp ../lib/amusing_git/default_messages #{ENV['HOME']}/.amusing_git/default_messages`
    end
  end
end
