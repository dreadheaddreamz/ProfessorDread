require_relative './ProfessorDread/version'
require_relative 'cli'
require_relative 'Poke'
require_relative 'api'
require "httparty"
require "pry"
require "nokogiri"

module ProfessorDread
  class Error < StandardError; end
  # Your code goes here...
end
