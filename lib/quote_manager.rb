class QuoteManager
  def initialize(file_path)
    @quotes = load_quotes(file_path)
  end

  def sample_quote
    @quotes.sample
  end

  private

  def load_quotes(file_path)
    quotes = []
    current_quote = ""
    current_attribution = ""

    File.readlines(file_path).each do |line|
      line = line.strip
      if line.start_with?('"')
        unless current_quote.empty?
          quotes << { quote: current_quote.strip, attribution: current_attribution.strip }
        end
        current_quote = line
        current_attribution = ""
      elsif line.start_with?('-') || line.start_with?('–') || line.start_with?('—')
        current_attribution = line[1..-1].strip
      elsif !line.empty?
        current_quote += " " + line
      end
    end

    quotes << { quote: current_quote.strip, attribution: current_attribution.strip } unless current_quote.empty?

    quotes
  end
end
