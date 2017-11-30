require_relative("./password")

module PasswordGenerator
  class Generator
    def self.run(options)
      loop do
        password = Password.new(options)

        if password.strong?
          puts password
          break
        end
      end
    end
  end
end
