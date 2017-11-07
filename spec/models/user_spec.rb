require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {
    described_class.new(name: "Name", email: "good@email.com",
                        password: "testowe123", password_confirmation: "testowe123")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid

    subject.name = " " * 5
    expect(subject).to_not be_valid
  end

  it "is not valid with too long name" do
    subject.name = "a"*51
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid

    subject.email = " " * 5
    expect(subject).to_not be_valid
  end

  it "is not valid with too long email" do
    subject.email = "a"*244 + "@example.com"
    expect(subject).to_not be_valid
  end

  it "is not valid with wrong emails" do
    wrong_emails = %w[abcdef a abc_ef test@test123 test@wrong.123 foo@bar..com
                      user.name@example. foo@bar_baz.com foo@bar+baz.com]

    wrong_emails.each do |email|
      subject.email = email
      expect(subject).to_not be_valid
    end
  end

  it "is valid with correct emails" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn]

    valid_emails.each do |email|
      subject.email = email
      expect(subject).to be_valid
    end
  end

  it "is not valid with existing email" do
    subject.save
    user = described_class.new(name: "Name", email: "good@email.com")
    expect(user).to_not be_valid

    user = described_class.new(name: "Name", email: "GOOD@EMAIL.com")
    expect(user).to_not be_valid
  end

  it "has email downcased when saved to DB" do
    subject.email = "GooD@EXAmple.COM"
    subject.save
    subject.reload
    expect(subject.email).to eq "good@example.com"
  end

  it "requires nonblank password" do
    subject.password = subject.password_confirmation = " " * 8
    expect(subject).to_not be_valid
  end

  it "requires password with minimum length of 8 characters" do
    subject.password = subject.password_confirmation = "a" * 7
    expect(subject).to_not be_valid
  end
end