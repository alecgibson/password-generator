require "optparse"
require_relative ("./password-generator/password")
require_relative ("./password-generator/generate")

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: password-generator.rb [options]"

  opts.on("-l", "--length N", Integer, "Password length (default: #{PasswordGenerator::Password.new.length})") do |length|
    options[:length] = length
  end

  opts.on("-s", "--symbols S", String, "Allowed symbols (default: #{PasswordGenerator::Password.new.symbols})") do |symbols|
    options[:symbols] = symbols
  end
end.parse!

PasswordGenerator::Generator.run(options)
