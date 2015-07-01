class Api::V1::SnippetSerializer < Api::V1::BaseSerializer
  attributes :id, :content, :created_at, :update_at, :token

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end