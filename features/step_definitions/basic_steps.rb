Given("the following articles exist") do |table|
  table.hashes.each do |article|
    create(:article, article)
  end
end

Given("I am on the {string} page") do |page_name|
  visit page_path(page_name)
end

Then("I should be on the {string} page") do |path_name|
  expect(page.current_path).to eq page_path(path_name)
end

Then("I fill in {string} with {string}") do |element, content|
  fill_in(element, with: content)
end

Then("I click on {string}") do |button_name|
  click_link_or_button(button_name)
end

Then("I should see {string}") do |message|
  expect(page).to have_content message
end

Then("show me the page") do
  save_and_open_page
end

def page_path(path)
  if path == 'Create Article'
    new_article_path
  elsif path == 'Index'
    root_path
  elsif (path == 'Holger is the best') || (path == 'Jade loves cookies') # || (add new path here)
    find_article(path)
  else
    raise "You need to add #{path} to page_path function"
  end
end

def find_article(title)
  article = Article.find_by(title: title)
  article_path(article)
end
