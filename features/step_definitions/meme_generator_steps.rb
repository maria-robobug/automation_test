Given(/^I navigate to the (.*) page$/) do |page_name|
  @image_flip_home_page = create_page page_name, @browser
  @image_flip_home_page.visit_page
end

And(/^I click the make a meme link$/) do
  @image_flip_meme_generator_page = @image_flip_home_page.click_make_a_meme
end

And(/^I generate the '(.*)' meme:$/) do |meme_type, table|
  @meme_type = meme_type

  table.hashes.each do |hash|
    @top_text = hash[:top_text]
    @bottom_text = hash[:bottom_text]
  end

  @image_flip_meme_generator_page = create_page "ImageFlip Meme Generator", @browser
  @image_flip_meme_generator_page.generate_meme @top_text, @bottom_text, @meme_type
end

And(/^I see the meme lightbox$/) do
  expect(@image_flip_meme_generator_page.lightbox_displayed?).to eq(true)
end

When(/^I click the go to image page button$/) do
  @image_link = @image_flip_meme_generator_page.click_go_to_image_page
end

Then(/^I should see the expected meme descriptions$/) do
  @image_flip_image_page = create_page "ImageFlip Image", @browser

  expect(@image_flip_image_page.title_shown?(@meme_type)).to eq(true)
  expect(@image_flip_image_page.descriptions_shown?(@top_text, @bottom_text)).to eq(true)
end
