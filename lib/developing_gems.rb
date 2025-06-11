# frozen_string_literal: true

require_relative "developing_gems/version"
require_relative "developing_gems/default_gems"
require 'producing'

module DevelopingGems
  def self.load(verb, gems = nil)
    return if Producing.true?
    gems ||= ENV['DEVELOPING_GEMS']&.split(/\s+/)
    gems ||= default_gems
    script = gems.map { |gem| "#{verb} #{gem.inspect}"}.join("\n")
    eval(script)
  end

  def self.requires(gems = nil)
    load("require", gems)
  end

  def self.gems(gems = nil)
    load("gem", gems)
  end
end
