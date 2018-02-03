Dir["#{ENV["PWD"]}/lib/*.rb"].each { |file| require_relative file }
require 'pry'
require 'dotenv'