require_relative './pretty_printer'
require_relative './git/git_repository'
require_relative './config/config'

module AmusingGit
  class Amuser
    include AmusingGit::PrettyPrinter

    def initialize
      @config = AmusingGit::Config.new
    end

    def amuse
      msgs = @config.messages
      return if msgs.empty?
      print_info(msgs[rand(0..msgs.size-1)] + "\n")
    end

    def start_amusing(dir)
      unless AmusingGit::GitRepository.git_repo? dir
        print_error "#{dir} is not a git repository, halting...\n"
        return
      end

      git_repository = AmusingGit::GitRepository.new dir, @config
      git_repository.create_hooks! unless git_repository.has_hooks?
      git_repository.configure_amusing_git!

      print_success "Done :)\n"
    end

    def stop_amusing(dir)
      unless AmusingGit::GitRepository.git_repo? dir
        print_error "#{dir} is not a git repository, halting...\n"
        return
      end

      git_repository = AmusingGit::GitRepository.new dir
      return unless git_repository.has_hooks?
      git_repository.remove_amusing_git!

      print_success "Done :)\n"
    end
  end
end
