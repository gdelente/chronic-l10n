def removeaccents(string)
  accents = {
    'E' => [200,201,202,203],
    'e' => [232,233,234,235],
    'A' => [192,193,194,195,196,197],
    'a' => [224,225,226,227,228,229,230],
    'C' => [199],
    'c' => [231],
    'O' => [210,211,212,213,214,216],
    'o' => [242,243,244,245,246,248],
    'I' => [204,205,206,207],
    'i' => [236,237,238,239],
    'U' => [217,218,219,220],
    'u' => [249,250,251,252],
    'N' => [209],
    'n' => [241],
    'Y' => [221],
    'y' => [253,255],
    'AE' => [306],
    'ae' => [346],
    'OE' => [188],
    'oe' => [189]
  }

  str = String.new(string)
  accents.each do |letter,accents|
    packed = accents.pack('U*')
    rxp = Regexp.new("[#{packed}]", nil)
    str.gsub!(rxp, letter)
  end

  str
end

module Chronic
  module L10n
    FR_FR = {
      :direct_nums => [
                       ['un', '1']
                      ],
      :month_names => {
        /^janv\.?(ier)?$/ => :january,
        /^fevr\.?(ier)?$/ => :february,
        /^mars?$/ => :march,
        /^avr\.?(il)?$/ => :april,
        /^mai?$/ => :may,
        /^juin?$/ => :june,
        /^juill\.?(et)?$/ => :july,
        /^aout?$/ => :august,
        /^sept\.?(embre)?$/ => :september,
        /^oct\.?(obre)?$/ => :october,
        /^nov\.?(embre)?$/ => :november,
        /^dec\.?(embre)?$/ => :december
      },
      :units => {
        /^jour?$/ => :day
      }
      :pre_normalize => {
        :preprocess => proc {|str| removeaccents(str)},
        :pre_numerize => [
          [/\./, ':'],
          [/['"]/, ''],
          [/(.*),(.*)/, '\2 \1'],
        ],
        :pos_numerize => [
          [/\baujourd'hui\b/, 'ce jour'],
          [/\bdemain\b/, 'prochain jour'],
          [/\bhier\b/, 'il y a un jour'],
        ]
      },

      :grabber => {
        /il y a/ => :last,
        /ce/ => :this,
        /prochain/ => :next
      },

      :token => {
        :comma => /^,$/,
        :at => /^(as|@)$/,
        :in => /^em$/,
        :on => /^em$/,
        :and => /^e$/
      }
    }
  end
end
