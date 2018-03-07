require 'thor'
require_relative './setup'
require_relative './amuser'

module AmusingGit
  class CLI < Thor
    include AmusingGit::PrettyPrinter

    desc "start", "Start amusing for the current git repository"
    def start
      amuser.start_amusing Dir.pwd
    end

    desc "stop", "Stop amusing for the current git repository"
    def stop
      print_success "Done :)\n"
    end

    desc "amuse", "Print random messsage from configured messages"
    def amuse
      amuser.amuse
    end

    desc "setup", "Setup amusing git"
    def setup
      amusing_git_setup.start
    end

    private
    def amuser
      AmusingGit::Amuser.new
    end

    def amusing_git_setup
      AmusingGit::Setup.new
    end
  end
end
