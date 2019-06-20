class Book < ApplicationRecord
  before_save do |doc|
    doc.bar_code = doc.generate_bar_code
  end

  validates :title, presence: { message: 'Preencha o campo' }
  validates :author, presence: { message: 'Preencha o campo' }
  validates :publishing_company, presence: { message: 'Preencha o campo' }
  validates :year, presence: { message: 'Preencha o campo' }
  validates :category, presence: { message: 'Preencha o campo' }
  validates :bar_code, presence: { message: 'Preencha o campo' }
  validates :bar_code, uniqueness: { message: 'Insira outro código de barra' }
  validates :source_of_donation, presence: { message: 'Preencha o campo' }
  validates :amount, presence: { message: 'Preencha o campo' }

  def generate_bar_code
    require 'digest'
    loop do
      bar_code = [*('0'..'9')].sample(13).join
      break bar_code if Book.find_by(bar_code: bar_code).nil?
    end
  end
end
