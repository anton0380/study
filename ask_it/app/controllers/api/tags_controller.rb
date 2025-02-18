module Api
  class TagsController < ApplicationController
    def index
      tags = Tag.arel_table
      @tags = Tag.where(tags[:title].matches("%#{params[:term]}%"))
      # respond_to do |format|
      #   format.json
      # end
      render json: TagBlueprint.render(@tags)
    end
  end
end