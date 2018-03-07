require 'json'
require_relative './pretty_printer'
require_relative './message_seeder'

module AmusingGit
  class Setup
    include AmusingGit::PrettyPrinter

    def start
      if setup_exists?
        print_info "You already have amusing git setup, skipping...\n"
        return
      end

      print_info "Setting up amusing git configuration...\n"
      create_amusing_git_dir
      write_config
      copy_messages
      print_success "Setup is completed!\n"
    end

    def setup_exists?
      File.exists? "#{ENV['HOME']}/.amusing_git"
    end

    private
    def create_amusing_git_dir
      `mkdir #{ENV['HOME']}/.amusing_git`
    end

    def write_config
      File.open("#{ENV['HOME']}/.amusing_git/config", "w") do |f|
        f.write(JSON.pretty_generate(config))
      end
    end

    def copy_messages
      File.open("#{ENV['HOME']}/.amusing_git/default_messages", 'w') do |f|
        f.write(AmusingGit::MessageSeeder.seed)
      end
    end

    def config
      {
        "messages" => "#{ENV['HOME']}/.amusing_git/default_messages"
      }
    end
  end
end
