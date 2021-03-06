require_relative '../lib/concerns/findable'

class Genre

    attr_accessor :name

    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all 
    end

    def self.destroy_all
        @@all.clear
    end 

    def save
        @@all << self 
    end

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def songs 
        @songs
    end

    def artists
        @genre_array = []
        @songs.collect do |song|
            song.artist
        end.uniq
    end

end 