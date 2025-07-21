class EncodeBase64AttachmentService < ApplicationService
  attr_reader :attachment

  def initialize(attachment:)
    @attachment = attachment
  end

  def call
    mime_type = attachment.content_type
    extension = Rack::Mime::MIME_TYPES.invert[mime_type] || File.extname(attachment.filename.to_s)
    file = Tempfile.new([ "temp_file", extension ], binmode: true)
    file.write(attachment.download)
    file.rewind
    base64_attachment = Base64.strict_encode64(file.read)

    {
      base64_attachment:,
      mime_type:
    }
  end
end
