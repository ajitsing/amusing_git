require 'thor'
require_relative './setup'
require_relative './amuser'

module AmusingGit
  class CLI < Thor
    include AmusingGit::PrettyPrinter

    desc "start", "Start amusing for the current git repository"
    def start
      maybe_setup_amusing_git
      amuser.start_amusing Dir.pwd
    end

    desc "stop", "Stop amusing for the current git repository"
    def stop
      maybe_setup_amusing_git
      amuser.stop_amusing Dir.pwd
    end

    desc "amuse", "Print random message from configured messages, use `amusing_git help amuse` to know how to add your own messages"
    long_desc <<-LONGDESC
      `amusing_git amuse` will print a random message from the configured messages

      You can modify the configured messages. All the amusing_git config is present
      inside $HOME/.amusing_git directory
    LONGDESC
    def amuse
      maybe_setup_amusing_git
      amuser.amuse
    end

    desc "setup", "Setup amusing git"
    def setup
      amusing_git_setup.start
    end

    private
    def maybe_setup_amusing_git
      amusing_git_setup.start unless amusing_git_setup.setup_exists?
    end

    def amuser
      @amuser ||= AmusingGit::Amuser.new
    end

    def amusing_git_setup
      @amusing_git_setup ||= AmusingGit::Setup.new
    end
  end
end
