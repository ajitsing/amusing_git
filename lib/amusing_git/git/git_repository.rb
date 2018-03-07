require_relative './git_hook'

module AmusingGit
  class GitRepository
    def initialize(dir)
      @dir = dir
    end

    def has_hooks?
      File.exists? "#{@dir}/.git/hooks"
    end

    def create_hooks!
      `mkdir -p .git/hooks`
    end

    def configure_amusing_git!
      hooks = ["#{@dir}/.git/hooks/pre-push", "#{@dir}/.git/hooks/pre-reabse"].map { |h| AmusingGit::GitHook.new h}
      hooks.each do |hook|
        hook.create! unless hook.exists?
        hook.configure_amusing_git! unless hook.amusing?
      end
    end

    def self.git_repo? dir
      File.exists? "#{dir}/.git"
    end
  end
end
