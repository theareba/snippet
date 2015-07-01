module Api
  module V1
    class SnippetsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        if params[:limit]
          respond_with Snippet.order("id desc").limit(params[:limit])
        else
          respond_with Snippet.all
        end
      end

      def show
        snippet =  Snippet.find(params[:id])
        render(json: snippet)
      end

      def create
        respond_with Snippet.create(snippet_params)
      end

      def update
        respond_with Snippet.update(params[:id], params[:snippets])
      end

      def destroy
        respond_with Snippet.destroy(params[:id])
      end

      private
        def snippet_params
          params.require(:snippet).permit(:content, :private)
        end
    end
  end
end