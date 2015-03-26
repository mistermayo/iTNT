require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "signup_confirmation" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.signup_confirmation(user).deliver_now }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup Confirmation")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["admin@itnt.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Thank you for joining the QuANDA community!")
    end

  end
end
