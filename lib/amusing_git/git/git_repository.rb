require_relative './git_hook'

module AmusingGit
  class GitRepository
    def initialize(dir, config)
      @dir = dir
      @hooks = config.hooks
    end

    def has_hooks?
      File.exists? "#{@dir}/.git/hooks"
    end

    def create_hooks!
      `mkdir -p .git/hooks`
    end

    def configure_amusing_git!
      hooks.each do |hook|
        hook.create! unless hook.exists?
        hook.configure_amusing_git! unless hook.amusing?
      end
    end

    def remove_amusing_git!
      hooks.each do |hook|
        hook.remove_amusing_git! if hook.amusing?
      end
    end

    def self.git_repo? dir
      File.exists? "#{dir}/.git"
    end

    private
    def hooks
      @hooks.map { |hook_name| "#{@dir}/.git/hooks/#{hook_name}" }.map { |h| AmusingGit::GitHook.new h}
    end
  end
end
