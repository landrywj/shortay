require "rails_helper"

RSpec.describe ApplicationController, type: :routing do
    it "routes the root url to #home" do
      expect(get: "/").to route_to("application#home")
    end
end