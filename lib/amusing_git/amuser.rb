require_relative './pretty_printer'

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

    private
    def messages
      File.read(config["messages"]).split("\n")
    end

    def config
      JSON.parse(File.read("#{ENV["HOME"]}/.amusing_git/config"))
    end
  end
end
