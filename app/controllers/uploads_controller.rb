class UploadsController < ApplicationController
    def index
        upload= Upload.all
        render json: upload.map{|u| UploadSerializer.new(u).serializable_hash[:data][:attributes]}
    end

    def create
        upload = Upload.new(upload_params)
        if upload.save
            render json: upload
        else
            render json: {error: "Error creating upload"}
        end
    end

    private

    def upload_params
        params.require(:upload).permit(:file,:title)
    end
end
