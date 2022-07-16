require "open-uri"
require "json"
require "uri"
module Gem
  module Home
    module SpecLoader
      def self.get_issues_url(gem)
        data = pull_gemspec(gem)
        link = data["bug_tracker_uri"]
        return link if link && valid_url?(link)
        # looks like nobody gave us an issue tracker
        # are we working with a github link?
        github_link = github_repo(data)
        return [github_link, "issues"].join("/") if github_link
        return false
      end

      def self.get_home_url(gem)
        data = pull_gemspec(gem)
        link = data["homepage_uri"]
        return link if link && valid_url?(link)
        # looks like nobody gave us a homepage
        # are we working with a github link?
        github_link = github_repo(data)
        return github_link if github_link

        # jeeze, not even a github repo.
        # They don't deserve it, but we'll fall back to rubydocs
        return "http://www.rubydoc.info/gems/#{gem}"
      end

      def self.get_docs_url(gem)
        data = pull_gemspec(gem)
        link = data["documentation_uri"]
        return link if link && valid_url?(link)
        # looks like nobody gave us a documentation url
        # let's send them to rubydocs
        return "http://www.rubydoc.info/gems/#{gem}"
      end

      def self.pull_gemspec(gem)
        begin
          result = URI.open("http://rubygems.org/api/v1/gems/#{gem}.json").read
          return JSON.parse(result)
        rescue => e
          puts "Error loading #{gem} gem's spec from rubygems.org"
          puts e.message
          exit 1
        end
      end

      def self.valid_url?(url)
        url =~ URI::regexp
      end

      def self.github_repo(data)
        possible = ["homepage_uri", "wiki_uri", "documentation_uri", "source_code_uri", "bug_tracker_uri"]
        possible.each do |p|
          link = data[p]
          if link && link =~ /^(https{0,1}:\/\/)?(www\.)?github\.com/i
            matches = link.match(/^(https{0,1}:\/\/)?(www\.)?github\.com\/([a-zA-Z]+)\/([a-zA-Z]+)/i)
            return ["https://github.com", matches[3], matches[4]].join("/") if matches[3] && matches[4]
          end
        end
        return false
      end
    end
  end
end
