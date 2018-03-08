require 'json'
require_relative '../pretty_printer'

module AmusingGit
  class Config
    include AmusingGit::PrettyPrinter

    def initialize
      @config = read_config
    end

    def messages
      messages_file = @config["messages"]
      if messages_file.nil?
        print_error("AmusingGit: messages file not found...\n")
        return []
      end
      File.read(messages_file).split("\n")
    end

    def hooks
      @config["hooks"] || []
    end

    private
    def read_config
      begin
        JSON.parse(File.read("#{ENV["HOME"]}/.amusing_git/config"))
      rescue
        print_error("AmusingGit: Error reading config file.. To fix the issue delete the $HOME/.amusing_git dir and run `amusing_git setup`\n")
        {}
      end
    end
  end
end
