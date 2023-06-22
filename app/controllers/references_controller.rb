class ReferencesController < ApplicationController

    def create
        reference = Reference.new(reference_params)
        if reference.save
            render json: reference
        else
            render json: {error: "Error creating reference"}
        end
    end

    private

    def reference_params
        params.require(:reference).permit(:profile_id, :first_name, :last_name, :job_title, :organisation, :work_email, :phone_number)
    end


end
