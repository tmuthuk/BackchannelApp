require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "MyString",
      :text => "MyText",
      :user_name => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "textarea#post_text[name=?]", "post[text]"
      assert_select "input#post_user_name[name=?]", "post[user_name]"
      assert_select "input#post_category_id[name=?]", "post[category_id]"
    end
  end
end
