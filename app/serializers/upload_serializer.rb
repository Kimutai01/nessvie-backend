class UploadSerializer
  include JSONAPI::Serializer
  attributes :title, :id, :file_url, :file
end
