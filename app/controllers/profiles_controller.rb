class ProfilesController < ApplicationController
    skip_before_action :authorized, only: [:create, :show, :update]
    #create a profile from the user
    def create
        profile = Profile.new(profile_params)
        if profile.save
            render json: profile
        else
            render json: {error: "Error creating profile"}
        end
    end

    #show a profile

    def show
        profile = Profile.find(params[:id])
        render json: profile
    end

    def index
        profiles = Profile.all
        render json: profiles
    end

    #update a profile

    def update
        profile = Profile.find(params[:id])
        profile.update(profile_params)
        render json: profile
    end

    def destroy
        profile = Profile.find(params[:id])
        profile.destroy
        render json: {message: "Profile deleted"}
    end
    private

    def profile_params
        params.require(:profile).permit(:user_id, :first_name, :surname , :email, :phone, :address, :city, :country, :post_code, :profession, :dob, :job, :manual_handling_certificate, :health_and_safety_certificate,  :approved)
    end


end
