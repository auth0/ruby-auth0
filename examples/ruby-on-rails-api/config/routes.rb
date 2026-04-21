# frozen_string_literal: true

Rails.application.routes.draw do
  get "api/public", to: "api#public_endpoint"
  get "api/private", to: "api#private_endpoint"
  get "api/users", to: "api#users"
end
