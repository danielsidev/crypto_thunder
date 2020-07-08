# frozen_string_literal: true

require_relative 'lib/crypto_thunder/version'

Gem::Specification.new do |spec|
  spec.name          = 'crypto_thunder'
  spec.version       = CryptoThunder::VERSION
  spec.authors       = ['Daniel Siqueira']
  spec.email         = ['daniel.siqueira@m4u.com.br']

  spec.summary       = 'Encrypt and Decrypt data'
  spec.description   = 'This gem use the rails native encrypt and decrypt'
  spec.homepage      = 'https://github.com/danielsidev'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://github.com/danielsidev/crypto_thunder'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/danielsidev/crypto_thunder'
  spec.metadata['changelog_uri'] = 'https://github.com/danielsidev/crypto_thunder'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
