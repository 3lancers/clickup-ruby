# frozen_string_literal: true

module ClickUp
  class Member < APIResource
    extend ClickUp::APIOperations::All

    class << self
      def index_path(params={})
        if params.has_key?(:list_id)
          "/list/#{params[:list_id]}/member"
        elsif params.has_key?(:task_id)
          "/task/#{params[:task_id]}/member"
        else
          raise ArgumentError, "Either list_id or task_id is required."
        end
      end

      def rejected_params
        [
          :id,
          :list_id,
          :task_id
        ]
      end

      def formatted_params(params)
        params.reject {|key, _| rejected_params.include?(key) }
      end
    end
  end
end
