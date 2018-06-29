# frozen_string_literal: true

ActiveAdmin.register Rent do
  permit_params :user, :book, :from, :to

  index do
    selectable_column
    id_column
    column :user
    column :book
    column :from
    column :to
    actions
  end

  filter :user, as: :select, collection: User.all.pluck(:email, :id)
  filter :book
  filter :from
  filter :to
end
