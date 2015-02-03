module Gem
  module Home
    module Browser

      # open_url takes in a url, and attempts
      # to open it in a browser using `git web--browse {{link}}`
      def self.open_link(url)
        unless system("git", "web--browse", url)
          puts "Couldn't start Browser"
          puts "But, you can do it yourself!"
          puts link
          exit 1
        end
      end
    end
  end
end
