# frozen_string_literal: true

require 'notions/client'
require 'notions/configuration'
require 'notions/logger'
require 'notions/types/base'
require 'notions/types/array'
require 'notions/types/boolean'
require 'notions/types/checkbox'
require 'notions/util'
require 'notions/version'

module Notions
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.logger
    @logger ||= Notions::Logger.new(STDOUT,
      level: Notions::Logger::INFO
    )
  end
end
