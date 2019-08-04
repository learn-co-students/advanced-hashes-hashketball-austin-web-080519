# Write your code here!
require 'pry'

def game_hash
    game_hash = {   
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                "Alan Anderson" =>
                {
                    number: 0,
                    shoe: 16,
                    points: 22,
                    rebounds: 12,
                    assists: 12,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 1
                },
                "Reggie Evans" =>
                {
                    number: 30,
                    shoe: 14,
                    points: 12,
                    rebounds: 12,
                    assists: 12,
                    steals: 12,
                    blocks: 12,
                    slam_dunks: 7
                },
                "Brook Lopez" =>
                {  
                    number: 11,
                    shoe: 17,
                    points: 17,
                    rebounds: 19,
                    assists: 10,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 15
                },
                "Mason Plumlee" =>
                {
                    number: 1,
                    shoe: 19,
                    points: 26,
                    rebounds: 11,
                    assists: 6,
                    steals: 3,
                    blocks: 8,
                    slam_dunks: 5
                },
                "Jason Terry" => 
                {
                    number: 31,
                    shoe: 15,
                    points: 19,
                    rebounds: 2,
                    assists: 2,
                    steals: 4,
                    blocks: 11,
                    slam_dunks: 1
                }
            }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Jeff Adrien" =>
                {
                    number: 4,
                    shoe: 18,
                    points: 10,
                    rebounds: 1,
                    assists: 1,
                    steals: 2,
                    blocks: 7,
                    slam_dunks: 2
                },
                "Bismack Biyombo" =>
                {
                    number: 0,
                    shoe: 16,
                    points: 12,
                    rebounds: 4,
                    assists: 7,
                    steals: 22,
                    blocks: 15,
                    slam_dunks: 10
                },
                "DeSagna Diop" =>
                {
                    number: 2,
                    shoe: 14,
                    points: 24,
                    rebounds: 12,
                    assists: 12,
                    steals: 4,
                    blocks: 5,
                    slam_dunks: 5
                },
                "Ben Gordon" =>
                {
                    number: 8,
                    shoe: 15,
                    points: 33,
                    rebounds: 3,
                    assists: 2,
                    steals: 1,
                    blocks: 1,
                    slam_dunks: 0
                },
                "Kemba Walker" =>
                {
                    number: 33,
                    shoe: 15,
                    points: 6,
                    rebounds: 12,
                    assists: 12,
                    steals: 7,
                    blocks: 5,
                    slam_dunks: 12
                }
            }
        }
    }
end


def num_points_scored(player_name)
    game_hash.each do |team_side, team_data|
        team_data[:players].each do |name, player_data|
            if player_name == name
                return player_data[:points]
            end
        end
    end
end

def shoe_size(player_name)
    game_hash.each do |team_side, team_data|
        team_data[:players].each do |name, player_data|
            if player_name == name
                return player_data[:shoe]
            end
        end
    end
end

def team_colors(team_name)
    game_hash.each do |team_side, team_data|
        if team_data[:team_name] == team_name
            return team_data[:colors]
        end
    end
end


def team_names
    team_array = []
    team_array << game_hash[:home][:team_name]
    team_array << game_hash[:away][:team_name]
    team_array
end

def player_numbers(team_name)
    game_hash.collect do |team_side, team_data|
        if team_data[:team_name] == team_name
            team_data[:players].collect do |player_name, player_data|
                player_data[:number]
            end
        end
    end.compact.flatten
end

def player_stats(player_name)
    game_hash.each do |team_side, team_data|
        team_data[:players].each do |name, player_data|
            if player_name == name
                return team_data[:players][player_name]
            end
        end
    end
end

def big_shoe_rebounds
    biggest_shoe_size = 0
    biggest_shoe_rebounds = ""
    game_hash.each do |team_side, team_data|
        team_data[:players].each do |player_name, player_data|
            if player_data[:shoe] > biggest_shoe_size
                biggest_shoe_size = player_data[:shoe]
                biggest_shoe_rebounds = team_data[:players][player_name][:rebounds]
            end
        end
    end
    biggest_shoe_rebounds
end

def most_points_scored
    most_points = 0
    player_with_most_points = ""
    game_hash.each do |team_side, team_data|
        team_data[:players].each do |player_name, player_data|
            if player_data[:points] > most_points
                most_points = player_data[:points]
                player_with_most_points = player_name
            end
        end
    end
    player_with_most_points
end

def winning_team
    home_points = 0
    away_points = 0
    game_hash[:home][:players].each do |player_name, player_data|
        home_points += player_data[:points]
    end
    game_hash[:away][:players].each do |player_name, player_data|
        away_points += player_data[:points]
    end
    if home_points > away_points
        game_hash[:home][:team_name]
    elsif away_points > home_points
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    longest_name_length = 0
    longest_name_player = ""
    game_hash.each do |team_side, team_data|
        team_data[:players].each do |player_name, player_data|
            if player_name.length > longest_name_length
                longest_name_length = player_name.length
                longest_name_player = player_name
            end
        end
    end
    longest_name_player
end

def long_name_steals_a_ton?
end
