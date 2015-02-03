require "test_helper"

describe "Spec Loader" do
  let(:spec) {::Gem::Home::SpecLoader}

  before do
    stub_request(:get, "http://rubygems.org/api/v1/gems/full-json.json").
      to_return(:status => 200, :body => IO.read("test/stubs/full_data.json").strip)
    stub_request(:get, "http://rubygems.org/api/v1/gems/github-homepage-json.json").
      to_return(:status => 200, :body => IO.read("test/stubs/github_home.json").strip)
    stub_request(:get, "http://rubygems.org/api/v1/gems/github-issues-json.json").
      to_return(:status => 200, :body => IO.read("test/stubs/github_issues.json").strip)
    stub_request(:get, "http://rubygems.org/api/v1/gems/no-data-json.json").
      to_return(:status => 200, :body => IO.read("test/stubs/no_data.json").strip)
  end

  describe "issues" do
    it "Should use gemspec issues path if present" do
      link = spec.get_issues_url("full-json")
      assert_equal "https://getharpoon.com/issues", link
    end

    it "Should fallback to github if possible" do
      link = spec.get_issues_url("github-homepage-json")
      assert_equal "https://github.com/mazondo/harpoon/issues", link
    end
  end

  describe "docs" do
    it "Should use gemspec docs path if present" do
      link = spec.get_docs_url("full-json")
      assert_equal "http://docs.getharpoon.com", link
    end

    it "Should fallback to rubydocs if nothing else" do
      link = spec.get_docs_url("github-homepage-json")
      assert_equal "http://www.rubydoc.info/gems/github-homepage-json", link
    end
  end

  describe "home" do
    it "Should use gemspec home path if present" do
      link = spec.get_home_url("full-json")
      assert_equal "http://www.getharpoon.com", link
    end

    it "Should fallback to github if possible" do
      link = spec.get_home_url("github-issues-json")
      assert_equal "https://github.com/mazondo/harpoon", link
    end

    it "Should fallback to rubydoc if nothing else" do
      link = spec.get_docs_url("no-data-json")
      assert_equal "http://www.rubydoc.info/gems/no-data-json", link
    end
  end
end
