require "pdf/reader"

module Contracts
  module Extractors
    class PdfExtractor
      def self.call(file)
        text = +""

        file.open do |io|
          reader = PDF::Reader.new(io)
          reader.pages.each do |page|
            text << page.text
            text << "\n"
          end
        end

        sanitize(text)
      end

      def self.sanitize(text)
        text
          .encode("UTF-8", invalid: :replace, undef: :replace, replace: "")
          .gsub(/\u0000/, "")
      end
    end
  end
end
