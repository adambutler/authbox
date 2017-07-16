class AuthorizedUser < ApplicationRecord
  belongs_to :application, class_name: 'Doorkeeper::Application'
end
