require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with valid attributes" do
    user = User.create!(email: "test@example.com", password: "password")
    prototype = user.prototypes.create!(title: "Test Title", catch_copy: "Test Catch Copy", concept: "Test Concept")
    comment = prototype.comments.build(text: "Test Comment", user: user)
    expect(comment).to be_valid
  end

  it "is not valid without text" do
    user = User.create!(email: "test@example.com", password: "password")
    prototype = user.prototypes.create!(title: "Test Title", catch_copy: "Test Catch Copy", concept: "Test Concept")
    comment = prototype.comments.build(user: user)
    expect(comment).not_to be_valid
  end
end
