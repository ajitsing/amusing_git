require 'thor'
require_relative './setup'
require_relative './amuser'

module AmusingGit
  class CLI < Thor
    include AmusingGit::PrettyPrinter

    desc "start", "Start amusing for the current git repository"
    def start
      print_success "Done :)\n"
    end

    desc "stop", "Stop amusing for the current git repository"
    def stop
      print_success "Done :)\n"
    end

    desc "amuse", "Print random messsage from configured messages"
    def amuse
      amuser = AmusingGit::Amuser.new
      amuser.amuse
    end

    desc "setup", "Setup amusing git"
    def setup
      AmusingGit::Setup.new.start
    end
  end
end
