require_relative './pretty_printer'
require_relative './git/git_repository'

module AmusingGit
  class Amuser
    include AmusingGit::PrettyPrinter

    def amuse
      begin
        msgs = messages
        print_info(msgs[rand(0..msgs.size-1)] + "\n")
      rescue
        print_error "Error reading amusing git config file\n"
        return
      end
    end

    def start_amusing(dir)
      unless AmusingGit::GitRepository.git_repo? dir
        print_error "#{dir} is not a git repository, halting...\n"
        return
      end

      git_repository = AmusingGit::GitRepository.new dir

      unless git_repository.has_hooks?
        print_info "Creating git hooks...\n"
        git_repository.create_hooks!
      end

      git_repository.configure_amusing_git!
      print_success "Done :)\n"
    end

    private
    def messages
      File.read(config["messages"]).split("\n")
    end

    def config
      JSON.parse(File.read("#{ENV["HOME"]}/.amusing_git/config"))
    end
  end
end
