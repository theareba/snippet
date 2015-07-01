module Api
  module V1
    class SnippetsController < ApplicationController
      respond_to :json

      def index
        if params[:limit]
          respond_with Snippet.order("id desc").limit(params[:limit])
        else
          respond_with Snippet.all
        end
      end

      def show
        respond_with Snippet.find(params[:id])
      end

      def create
        respond_with Snippet.create(params[:snippet])
      end

      def update
        respond_with Snippet.update(params[:id], params[:snippets])
      end

      def destroy
        respond_with Snippet.destroy(params[:id])
      end
    end
  end
end