class Estate < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: 'Le titre est obligatoire' },
                    format: { with: /\A[A-Za-z\-\s()&:,'ÉÈéèêëôûüùïîàâäç.]+\z/, message: 'Ne pas utiliser de caractères spéciaux'},
                    length: { in: 3..100, message: 'La taille doit être entre 3 et 100 caractères' }

  validates :price, presence: { message: 'Vous devez renseigner un prix' },
                    numericality: { in: 1..400_000, message: 'Veuillez renseigner un prix entre 1 et 100' }

  validates :description, presence: { message: 'Une description est obligatoire' },
                          length: { in: 100..100_000, message: 'Il faut 100 caractères minimum' }
end
