module Contracts
  class ExtractText
    def self.call(contract)
      raise "No file attached" unless contract.file.attached?

      text =
        case contract.file.content_type
        when "application/pdf"
          Extractors::PdfExtractor.call(contract.file)
        when "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
          Extractors::DocxExtractor.call(contract.file)
        else
          raise "Unsupported file type: #{contract.file.content_type}"
        end

      contract.update!(raw_text: text)
    end
  end
end
