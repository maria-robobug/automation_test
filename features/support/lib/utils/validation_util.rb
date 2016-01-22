module ValidationUtil

  def self.valid_html(html)
    parsed_html = Nokogiri::XML::DocumentFragment.parse(html) {|config| config.strict}

    if parsed_html.errors.empty?
      true
    else
      raise "The following HTML is not valid due to these errors: #{parsed_html.errors}"
    end
  end
end