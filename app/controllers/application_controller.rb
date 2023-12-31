class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @q = Lens.ransack(params[:q])
        @lenses = @q.result.order(created_at: :asc)
    end
end
