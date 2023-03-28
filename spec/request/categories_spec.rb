require 'rails_helper'

RSpec.describe '/categories', type: :request do

    # Demo user
    current_user = User.first_or_create!(email: 'user@user.com', password: 'password', password_confirmation: 'password')

    # Valid data 
    let(:valid_attributes) do
        {
            'id' => '1',
            'title' => 'Test',
        }
    end

    # Invalid data 
    let(:invalid_attributes) do
        {
            'id' => 'abcde',
            'title' => 1,
        }
    end

    #
    describe 'GET /root' do
    
        it 'renders a successful response' do
            sign_in(current_user)
            category = Category.new(valid_attributes)
            category.user = current_user
            category.save
            get root_path
            expect(response).to be_successful
        end
    end

    #
    describe 'GET categories/new' do

        it 'renders a successful response' do
            sign_in(current_user)
            get new_category_path
            expect(response).to be_successful
        end
    end

    # Checks if it renders the edit category 
    describe 'GET categories/edit' do

        it 'renders a successful response' do
            sign_in(current_user)
            category = Category.new(valid_attributes)
            category.user = current_user
            category.save
            get edit_category_path(category)
            expect(response).to be_successful
        end
    end

    # checks if the post request is proceeding with correct data
    describe 'POST categories/create' do
        context 'with valid parameters' do
          it 'creates a new Category' do
            sign_in(current_user)
            expect do
              post categories_path, params: {category: valid_attributes}
            end.to change(Category, :count).by(1)
          end
        end
    
        context 'with invalid parameters' do
          it 'does not create a new Category' do
            sign_in(current_user)
            expect do
              post categories_path, params: {category: invalid_attributes}
            end.to change(Category, :count).by(1)
          end
        end
      end

      # Checks if the PATCH update is proceeding with valid data
      describe 'PATCH categories/update' do
        context 'with valid parameters' do
          let(:new_attributes) do
            {
              'id' => '1',
              'title' => 'New Category'
            }
          end

          it 'updates the requested category' do
            sign_in(current_user)
            category = Category.new(valid_attributes)
            category.user = current_user
            category.save
            patch category_path(category), params: {category: new_attributes}
            category.reload
            expect(category[:title]).to eq(new_attributes['title'])
          end
        end
      end

      # Checks if DELETE request is working and the selected category is being deleted
      describe 'DELETE categories/destroy' do
        it 'destroys the given category' do
          sign_in(current_user)
          category = Category.new(valid_attributes)
          category.user = current_user
          category.save
          expect do
            delete category_path(category)
          end.to change(Category, :count).by(-1)
        end
      end

end