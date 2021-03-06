# Write your code here!
## fist-step

require 'pry'

def game_hash
  # Write your code here!
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def get_player
  game_hash.values.map do |team_data|
    team_data[:players]
  end.flatten
end

def find_player(name)
  player = get_player.find do |player|
    player[:player_name] == name
  end
end

def num_points_scored(player_name)
  player = find_player(player_name)
  player[:points]
end

def shoe_size(player_name)
  # get_player.find{|player| player[:player_name] == player_name}[:shoe]
  player = find_player(player_name)
  player[:shoe] 
end

def team_names
  game_hash.values.map do |team_data|
    team_data[:team_name]
  end.flatten
end

def find_team(team_name)
  game_hash.values.map do |team_data|
    team_data[:team_name] == team_name
  end
end

def team_colors(team_name)
  game_hash.values.map do |team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def player_numbers(team_name)
  result = []
  game_hash.collect do |location, team_data|
    if game_hash[location][:team_name] == team_name
      game_hash[location][:players].collect do |player_list|
        player_list.collect do |player_attribute, player_data|
          if !result.include?(player_list[:number]) 
            result << player_list[:number]
          end
        end
      end
    end 
  end
  result
end

def player_stats(player_name)
  game_hash.values.map do |team_data|
    team_data[:players].collect do |player_list|
      if player_list[:player_name] == player_name
        player_list.delete(:player_name)
        return player_list
      end 
    end 
  end
end

def big_shoe_rebounds
  biggest_shoe_size = []
  game_hash.values.map do |team_data|
    team_data[:players].collect do |player_list|
      biggest_shoe_size << player_list[:shoe]
    end 
    result = biggest_shoe_size.index(biggest_shoe_size.max)
    return team_data[:players][result][:rebounds]
  end
end
