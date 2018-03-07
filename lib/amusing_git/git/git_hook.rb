module AmusingGit
  class GitHook
    def initialize(hook_file)
      @hook_file = hook_file
    end

    def exists?
      File.file? @hook_file
    end

    def create!
      `touch #{@hook_file}`
      `chmod +x #{@hook_file}`
    end

    def configure_amusing_git!
      `echo "amusing_git amuse" >> #{@hook_file}`
    end

    def amusing?
      File.read(@hook_file).include? 'amusing_git amuse'
    end
  end
end
