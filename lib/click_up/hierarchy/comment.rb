# frozen_string_literal: true

module ClickUp
  class Comment < APIResource
    extend ClickUp::APIOperations::All
    extend ClickUp::APIOperations::Create
    extend ClickUp::APIOperations::Delete

    class << self
      def index_path(params = {})
        if params.has_key?(:task_id)
          "/task/#{params[:task_id]}/comment"
        elsif params.has_key?(:view_id)
          "/view/#{params[:view_id]}/comment"
        elsif params.has_key?(:list_id)
          "/list/#{params[:list_id]}/comment"
        elsif params.has_key?(:comment_id)
          "/list/#{params[:comment_id]}/reply"
        else
          raise ArgumentError, "Either task_id or view_id or list_id or comment_id is required."
        end
      end

      def rejected_params
        [
          :id,
          :task_id,
          :view_id,
          :list_id,
          :comment_id
        ]
      end

      def formatted_params(params)
        params.reject { |key, _| rejected_params.include?(key) }
        # {
        #   "comment_text": "New Comment",
        #   "content": "Sent from API V2",
        #   "notify_all": false,
        #   "assignee": 53480,
        #   "group_assignee": 53481
        # }
      end
    end
  end
end
