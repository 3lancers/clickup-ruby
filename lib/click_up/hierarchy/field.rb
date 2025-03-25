# frozen_string_literal: true

module ClickUp
  class Field < APIResource
    extend ClickUp::APIOperations::All

    class << self
      def index_path(params = {})
        if params.has_key?(:list_id)
          "/list/#{params[:list_id]}/field"
        elsif params.has_key?(:folder_id)
          "/folder/#{params[:folder_id]}/field"
        elsif params.has_key?(:space_id)
          "/space/#{params[:space_id]}/field"
        elsif params.has_key?(:team_id)
          "/team/#{params[:team_id]}/field"
        else
          raise ArgumentError, "Either list_id or folder_id or space_id or team_id is required."
        end
      end

      def set(params = {})
        execute_request(:post, "/task/#{params[:task_id]}/field/#{params[:field_id]}", formatted_params(params))
      end

      def delete(params = {})
        execute_request(:delete, "/task/#{params[:task_id]}/field/#{params[:field_id]}")
      end

      def rejected_params
        [
          :id,
          :list_id,
          :folder_id,
          :space_id,
          :team_id
        ]
      end

      def formatted_params(params)
        params.reject { |key, _| rejected_params.include?(key) }
      end
    end
  end
end
