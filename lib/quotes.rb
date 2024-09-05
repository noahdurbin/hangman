class Quotes
  def initialize
    @quotes = []
  end

  def load(filename)
    File.readlines(filename).each do |line|
      quote, attribution = line.split('-', 2)
      quote = quote.strip.gsub(/\A"|"\Z/, '')
      @quotes << { quote: quote, attribution: attribution&.strip }
    end
  end

  def choose
    @quotes.sample
  end
end
