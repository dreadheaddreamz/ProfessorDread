require_relative './ProfessorDread/version'
require_relative 'cli'
require_relative 'Poke'
require_relative 'api'
require "poke-api-v2"
require "httparty"
require "pry"
require "nokogiri"

module ProfessorDread
  class Error < StandardError; end
  # Your code goes here...
end
