class MovieSerializer < ActiveModel::Serializer
  attributes :title, :year, :length, :description, :director, :poster_url, :category, :discount, :female_director, :summary

end
