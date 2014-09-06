require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do
    it "should have the content 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_content('home')
    end

    it "should have the title 'home'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | home")
    end
  end

  describe "about page" do
    it "should have the content 'about'" do
      visit '/static_pages/about'
      expect(page).to have_content('about')
    end
  end

  describe "help page" do
    it "should have the content 'help'" do
      visit '/static_pages/help'
      expect(page).to have_content('help')
    end

    it "should have the title 'help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | help")
    end
  end

  describe "contact page" do

    it "should have the content 'contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('contact')
    end

    it "should have the title 'contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title} | contact")
    end
  end



end
