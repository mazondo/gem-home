class Gem::Commands::DocsCommand < Gem::Command

  def initialize
    super 'docs', "Open a gem's documentation"
  end

  def execute
    require "rubygems/home/spec_loader"
    require "rubygems/home/browser"

    name = get_one_gem_name
    link = ::Gem::Home::SpecLoader.get_docs_url(name)
    if link
      ::Gem::Home::Browser.open_link(link)
    else
      puts "We did our best, but there are no links for this gem"
      exit 1
    end
  end
end
