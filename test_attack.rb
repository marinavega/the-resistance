#!/usr/bin/env ruby

require 'net/http'
require 'json'

class String
  def red; "\e[31m#{self}\e[0m" end
  def green; "\e[32m#{self}\e[0m" end
  def cyan; "\e[36m#{self}\e[0m" end
end

API_ENDPOINT="http://localhost:3000"

test_cases = JSON.parse(File.read('test_cases.json'))

test_cases["cases"].each.with_index(1) do |item, index|
  input = item["input"]
  expected = item["output"]

  uri = URI.parse("#{API_ENDPOINT}/radar")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type': 'application/json'})
  request.body = input.to_json
  output = JSON.parse(response = http.request(request).body)

  if output["position"] == expected["position"] && (output["targets"] - expected["targets"]).empty?
    puts "Test #{index} : #{"[  OK  ]".green}"
  else
    puts "Test #{index} : #{"[  FAIL  ]".red}"
    puts " > #{"INPUT".cyan}:    #{input}"
    puts " > #{"EXPECTED".cyan}: #{expected}"
    puts " > #{"OUTPUT".cyan}:   #{output}"
    exit 1
  end
end
