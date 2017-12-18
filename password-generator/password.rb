module PasswordGenerator
  class Password
    UPPER_CASE = ("A".."Z").to_a.join.freeze
    LOWER_CASE = ("a".."z").to_a.join.freeze
    NUMBERS = (0..9).to_a.join.freeze

    attr_reader :length, :symbols

    def initialize(options = {})
      @length = options[:length] || 28
      @symbols = options[:symbols] || "!@#$%^&*"
    end

    def to_s
      @password ||= begin
        length.times.reduce("") do |password|
          password + random_character
        end
      end
    end

    def strong?
      character_groups.all? { |group| /[#{group}]/ =~ to_s }
    end

  private

    def character_groups
      @character_groups ||= [
        UPPER_CASE,
        LOWER_CASE,
        NUMBERS,
        symbols,
      ].reject(&:empty?)
    end

    def characters
      @characters ||= character_groups.join
    end

    def random_character
      index = Random.rand(characters.length)
      characters[index]
    end
  end
end
