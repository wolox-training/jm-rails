# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :genre, :author, :image, :title, :publisher, :year

  index do
    selectable_column
    id_column
    column :genre
    column :author
    column :image
    column :title
    column :publisher
    column :year
    actions
  end

  filter :genre
  filter :author
  filter :image
  filter :title
  filter :publisher
  filter :year
end
