# spec/factories/sessions.rb
FactoryBot.define do
  factory :session do
    token { SecureRandom.hex(10) }
    email { "user@example.com" }
  end
end
