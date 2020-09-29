# -*- encoding: utf-8 -*-
# stub: coingecko_client 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "coingecko_client".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "homepage_uri" => "https://github.com/Bruck1701/coingecko_client", "source_code_uri" => "https://github.com/Bruck1701/coingecko_client" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bruck1701".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-07-07"
  s.description = "This is my first gem and the idea was to develop a super simple and lightweight client to connect with Coingecko API. \n  Keep in mind that this is by no means an oficial gem from Coingecko, it is a MIT license pet project! Use at your own discretion!\n  I published it originally with the methods that I needed for another project, but I'll keep on adding more methods to interact with the rest of the API. Any comments, sugestions, Pull Requests, feel free to contact me.".freeze
  s.email = ["kummel@gmail.com".freeze]
  s.homepage = "https://github.com/Bruck1701/coingecko_client".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A simple coingecko API client".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<excon>.freeze, ["~> 0.75.0"])
    s.add_runtime_dependency(%q<json>.freeze, ["~> 2.3"])
  else
    s.add_dependency(%q<excon>.freeze, ["~> 0.75.0"])
    s.add_dependency(%q<json>.freeze, ["~> 2.3"])
  end
end
