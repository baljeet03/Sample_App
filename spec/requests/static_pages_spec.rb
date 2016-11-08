require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Sample App') }
  end

  describe "Help Page" do
    it "should have the content 'Help'" do
      visit help_path
      page.should have_content('Help')
    end
  end

  describe "About Page" do
    it "should have the content 'About'" do
      visit about_path
      page.should have_content('About')
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_content("Contact")
    end
  end
end
