require 'chronic'

module Chronic
  module L10n

    class << self
    end

    require 'chronic-l10n/pt_br'
    Chronic.add_locale :'pt-BR', Chronic::L10n::PT_BR

    require 'chronic-l10n/it_it'
    Chronic.add_locale :'it-IT', Chronic::L10n::IT_IT

    require 'chronic-l10n/fr_fr'
    Chronic.add_locale :'fr-FR', Chronic::L10n::FR_FR
  end
end
