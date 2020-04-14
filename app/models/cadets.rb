class Cadets < ApplicationRecord
    validates :CWID, presence: true, length: { minimum: 8, maximum: 8}
    validates :CO_ID, presence: true, length: { minimum: 1, maximum: 2}
    validates :C_STATUS, presence: true, length: { minimum: 1, maximum: 1}
    validates :F_NAME, presence: true, length: { minimum: 2, maximum: 20}
    validates :L_NAME, presence: true, length: { minimum: 2, maximum: 20}
    validates :EMAIL, presence: true, length: { minimum: 5, maximum: 50}
    validates :RANK_ID, presence: true, length: { minimum: 1, maximum: 2}
end  