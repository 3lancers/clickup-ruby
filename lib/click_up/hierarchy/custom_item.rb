# frozen_string_literal: true

module ClickUp
  class CustomItem < APIResource
    extend ClickUp::APIOperations::All

    class << self
      def index_path(params={})
        "/team/#{params[:team_id]}/custom_item"
      end
    end
  end
end
