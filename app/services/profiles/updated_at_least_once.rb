module Profiles
  class UpdatedAtLeastOnce < ApplicationService
    attr_reader :profile

    def initialize(profile)
      @profile = profile
    end

    def call
      profile.updated_at > profile.created_at
    end
  end
end

