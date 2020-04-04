# Write your code here!

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

def num_points_scored(player_name)
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      team_data[:players].collect do |player_list|
        if player_list[:player_name] == player_name
          return player_list[:points]
        end
      end 
    end 
  end
end

def shoe_size(player_name)
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      game_hash[location][:players].collect do |player_list|
        if player_list[:player_name] == player_name
          return player_list[:shoe]
        end
      end
    end 
  end 
end

def team_colors(team_name)
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if data == team_name
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  result = []
  game_hash.collect do |location, team_data|
    result << game_hash[location][:team_name]
  end
  result
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
  result = {}
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      team_data[:players].collect do |player_list|
        if player_list[:player_name] == player_name
          # player_list.delete_if{|key, value| key == 'player_name'}
          # return player_list
          result[:number] = player_list[:number]
          result[:shoe] = player_list[:shoe]
          result[:points] = player_list[:points]
          result[:rebounds] = player_list[:rebounds]
          result[:assists] = player_list[:assists]
          result[:steals] = player_list[:steals]
          result[:blocks] = player_list[:blocks]
          result[:slam_dunks] = player_list[:slam_dunks]
          return result
        end 
      end 
    end 
  end
end

def big_shoe_rebounds
  biggest_shoe_size = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      team_data[:players].collect do |player_list|
        biggest_shoe_size << player_list[:shoe]
      end 
      result = biggest_shoe_size.index(biggest_shoe_size.max)
      return team_data[:players][result][:rebounds]
    end
  end
end
