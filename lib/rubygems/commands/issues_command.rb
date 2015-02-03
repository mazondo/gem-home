class Gem::Commands::IssuesCommand < Gem::Command

  def initialize
    super 'issues', "Open a gem's issue tracker"
  end

  def execute
    require "rubygems/home/spec_loader"
    require "rubygems/home/browser"

    name = get_one_gem_name
    link = ::Gem::Home::SpecLoader.get_issues_url(name)
    ::Gem::Home::Browser.open_link(link)
  end
end
