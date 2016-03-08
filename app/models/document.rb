class Document < ActiveRecord::Base
  SUPPORTED_FORMATS = %w(doc pdf docx txt png xls xlsx ai psd odt dxf dwg jpg jpeg gif tiff mpp)

  belongs_to :course

  has_attached_file :file, bucket: ENV['S3_FILES_BUCKET_NAME']
  validates_attachment :file, presence: true,
                       content_type: { content_type: /(#{SUPPORTED_FORMATS.join('|')})/, message: "only #{SUPPORTED_FORMATS.join(', ')} files" }

  def file_name
    File.basename self.file.url(:default, false)
  end
end
