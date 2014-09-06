require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('home') }
    it {should have_title(full_title("home"))}
  end

  describe "about page" do
    before { visit about_path }

    it { should have_content('about') }
    it {should have_title(full_title("about"))}
  end

  describe "help page" do
    before { visit help_path }

    it { should have_content('help') }
    it {should have_title(full_title("help"))}
  end

  describe "contact page" do
    before { visit contact_path }

    it { should have_content('contact') }
    it {should have_title(full_title("contact"))}
  end



end
