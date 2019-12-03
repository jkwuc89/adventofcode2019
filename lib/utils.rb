module Utils
  def self.read_numbers_from(file:)
    File.readlines(file).map(&:to_i)
  end
end
