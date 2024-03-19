# frozen_string_literal: true

require_relative '../test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @categories = categories(:one)
    get '/users/sign_in'
    sign_in(users(:one))
  end
  test 'should get index' do
    get posts_url

    assert_response :success
  end

  test 'should get new' do
    get new_post_path

    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: {
        post: {
          title: @post.title,
          body: @post.body,
          category_id: @categories.id,
          creator: users(:one),
          image: fixture_file_upload('post_image.jpg', 'image/jpg')
        }
      }
    end
  end

  test 'should show post' do
    get post_url(@post)

    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: {
      post: {
        title: @post.title,
        body: @post.body,
        category_id: @categories.id,
        creator: users(:one),
        image: fixture_file_upload('post_image.jpg', 'image/jpg')
      }
    }

    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end
    assert_redirected_to root_path
  end
end
