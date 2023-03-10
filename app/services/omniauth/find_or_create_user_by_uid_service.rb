module Omniauth
  class FindOrCreateUserByUidService < ApplicationService
    attr_reader :auth

    def initialize(auth)
      @auth = auth
    end

    def call
      User.where(uid: @auth.uid).first_or_create do |user|
        user.email = @auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.full_name = @auth.info.name
        user.avatar_url = @auth.info.image
        user.alias = Faker::Food.unique.dish
      end
    end
  end
end