# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "unfurl"
  spec.version       = "0.1.2"
  spec.authors       = ["Michael Seneadza"]
  spec.email         = ["mseneadza@alumni.stanford.edu"]

  spec.summary       = "Takes a matrix (or two dimensional array) as input and returns a string representation"
  spec.description   = %q{This Ruby gem takes a matrix (or two dimensional array) and returns a string.
                          The matrix may be of arbitrary size and must consist of uppercase English letters.
                          The returned string will consist of all elements of the matrix ordered in a clockwise spiral
                          pattern starting with element [0, 0].  Each letter will be converted to lowercase and separated
                          by a single whitespace character.}
  spec.homepage      = "https://github.com/MSeneadza/unfurl"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
