require 'rails_helper'

RSpec.describe 'Blogモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:blog) { build(:blog, user_id: user.id) }#blog作成
  context 'titleカラム' do
      it '空欄でないこと' do
        blog.title = ''
        expect(blog.valid?).to eq false;
      end
   end

  context 'bodyカラム' do
  	it '空欄でないこと' do
  	  blog.body = ''
  	  expect(blog.valid?).to eq false;
  	end
  end
end
end