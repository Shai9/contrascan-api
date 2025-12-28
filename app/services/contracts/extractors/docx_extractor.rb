require "docx"

module Contracts
  module Extractors
    class DocxExtractor
      def self.call(file)
        text = +""

        file.open do |io|
          doc = Docx::Document.open(io)
          doc.paragraphs.each do |p|
            text << p.text
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
