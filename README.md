# Gem::Home

Adds some useful extensions to the default `gem` command

The gem tries to do some clever things to get you somewhere no matters what:
 * First the explicit docs, homepage or issues links are used from the spec
 * If not present, and the gem is stored on github, it'll use the relevant github links
 * If not on github, the gem falls back to the rubydoc page for the gem

## Installation

    $ gem install gem-home

## Usage

```bash
gem home gem-name
 # opens the gem's homepage
gem issues gem-name
 # opens the gem's issue tracker for bug reporting
gem docs gem-name
 # opens the gem's documentation
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gem-home/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
