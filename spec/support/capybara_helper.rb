module CapybaraHelper
  def dt(title, target = 'div', slashes = true)
    # using xpath with capybara's within method adds extra '//'
    root = '//' if slashes == true
    "#{root}#{target}[@data-test='#{title}']"
  end
end