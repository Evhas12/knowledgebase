require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  
  test "must deliver a valid message" do
    visit new_contact_url
    fill_in 'Topic', :with => 'This is a new Topic by Chetan Mittal'
    fill_in 'Name', :with => 'Chetan Mittal'
    fill_in 'Email', :with => 'chetanmittal@opensourceknowledgebaseapp.dev'
    fill_in 'Message', :with => 'What a great open source application.'
    click_button 'Send message'
    assert_text "Thank you for your message"
  end

  test "does not deliver a message with a missing topic" do
    visit new_contact_url
    fill_in 'Name', :with => 'Chetan Mittal'
    fill_in 'Email', :with => 'chetanmittal@opensourceknowledgebaseapp.dev'
    fill_in 'Message', :with => 'What a great open source application.'
    click_button 'Send message'
    assert_text "Topic can't be blank"
  end

  test "does not deliver a message with a missing name" do
    visit new_contact_url
    fill_in 'Topic', :with => 'This is a new Topic by Chetan Mittal'
    fill_in 'Email', :with => 'chetanmittal@opensourceknowledgebaseapp.dev'
    fill_in 'Message', :with => 'What a great open source application.'
    click_button 'Send message'
    assert_text "Name can't be blank"
  end

   test "does not deliver a message with a missing email" do
     visit new_contact_url
     fill_in 'Topic', :with => 'This is a new Topic by Chetan Mittal'
     fill_in 'Name', :with => 'Chetan Mittal'
     fill_in 'Message', :with => 'What a great open source application.'
     click_button 'Send message'
     assert_text "Email can't be blank"
   end

 end