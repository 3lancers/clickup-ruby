# frozen_string_literal: true

module ClickUp
  class Webhook < APIResource
    extend ClickUp::APIOperations::All
    extend ClickUp::APIOperations::Create
    extend ClickUp::APIOperations::Update
    extend ClickUp::APIOperations::Delete

    class << self
      def index_path(params={})
        "/team/#{params[:team_id]}/webhook"
      end

      def resource_path(params={})
        "/webhook/#{params[:id]}"
      end

      def rejected_params
        [
          :id,
          :team_id
        ]
      end

      def formatted_params(params)
        params.reject {|key, _| rejected_params.include?(key) }
      end
    end
  end
end
