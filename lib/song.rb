require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre

    extend Concerns::Findable

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        self.name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        self.genre.add_song(self)
    end

    def save
        self.class.all.push(self)
    end

    def self.new_from_filename(filename)
        artist_name, song_name, genre_name = filename.split(" - ")
        song = self.new(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name.gsub(".mp3", ""))
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
        song
    end
end