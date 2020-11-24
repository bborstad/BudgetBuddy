class MentionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all #pulls list of users so it can populate Mentions selection
        
        respond_to do |format|
            format.json
        end
    end

end