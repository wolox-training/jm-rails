# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: 'Dashboard'

  content title: 'Admin Dashboard' do
    columns do
      column do
        panel 'Recent Rents' do
          ul do
            Rent.last(5).map do |rent|
              li link_to(rent.book.title, admin_rent_path(rent))
            end
          end
        end
      end

      column do
        panel 'Info' do
          para 'Welcome to ActiveAdmin.'
        end
      end
    end
  end
end
