require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameが空だと登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空だと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "encrypted_passwordが空だと登録できない" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    it "firstname_fullangleが空だと登録できない" do
      user = build(:user, firstname_fullangle: "")
      user.valid?
      expect(user.errors[:firstname_fullangle]).to include("can't be blank")
    end

    it "lastname_fullangleが空だと登録できない" do
      user = build(:user, lastname_fullangle: "")
      user.valid?
      expect(user.errors[:lastname_fullangle]).to include("can't be blank")
    end

    it "firstname_kanaが空だと登録できない" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it "lastname_kanaが空だと登録できない" do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    it "birthdayが空だと登録できない" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "postal_cordが空だと登録できない" do
      user = build(:user, postal_cord: "")
      user.valid?
      expect(user.errors[:postal_cord]).to include("can't be blank")
    end

    it "prefectureが空だと登録できない" do
      user = build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    it "cityが空だと登録できない" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "address_numberが空だと登録できない" do
      user = build(:user, address_number: "")
      user.valid?
      expect(user.errors[:address_number]).to include("can't be blank")
    end

    it "phone_numberが空だと登録できない" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    it "nicknameが20文字以上だと登録できない" do
      user = build(:user, nickname: "a" * 25)
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "nicknameが1文字以上であれば登録できる" do
      user = build(:user, nickname: "a")
      expect(user).to be_valid
    end

    it "encrypted_passwordが6文字以上だと登録できる" do
      user = build(:user, encrypted_password: "aaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "encrypted_passwordが128文字以上だと登録できない" do
      user = build(:user, nickname: "a" * 129)
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "firstname_kanaが全角カナでないと登録できない" do
      user = build(:user, firstname_kana: "aア")
      user.valid?
      expect(user.errors[:firstname_kana][0]).to include("is invalid")
    end

    it "lastname_kanaが全角カナでないと登録できない" do
      user = build(:user, lastname_kana: "aア")
      user.valid?
      expect(user.errors[:lastname_kana][0]).to include("is invalid")
    end

    it "重複したemailが存在すると登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "全てのバリデーション条件クリアすると登録できる。nickname, encrypted_password, email, firstname_fullangle, lastname_fullangle, firstname_kana, lastname_kana, birthday, postal_cord, prefecture, city, address_number, phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
