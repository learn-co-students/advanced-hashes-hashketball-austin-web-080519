require "pry"

def game_hash
  gamehash = {home: 
                {team_name: "Brooklyn Nets",
                colors: ["Black", "White"],
                players: [{
                  name: "Alan Anderson",
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
                  name: "Reggie Evans",
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
                  name: "Brook Lopez",
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
                  name: "Mason Plumlee",
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
                  name: "Jason Terry",
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
             away:
                {team_name: "Charlotte Hornets",
                colors: ["Turquoise", "Purple"],
                players: [
                          {
                  name: "Jeff Adrien",
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
                  name: "Bismack Biyombo",
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
                  name: "DeSagna Diop",
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
                  name: "Ben Gordon",
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
                  name: "Kemba Walker",
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

def num_points_scored(name)
  point = "-1"
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :players
        for i in (0...value.length)
          point = value[i][:points] if value[i][:name] == name
        end
      end
    end
  end
  return point
end

def shoe_size(name)
  size = "-1"
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :players
        for i in (0...value.length)
          size = value[i][:shoe] if value[i][:name] == name
        end
      end
    end
  end
  return size
end

def team_colors(name)
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :team_name && value == name
        return teamdata[:colors]
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :team_name
        names << value
      end
    end
  end
  return names
end


def player_numbers(team)
  nums = []
  game_hash.each do |homeness, teamdata|
    if teamdata[:team_name] == team
      teamdata[:players].each do |player|
        nums << player[:number]
      end
    end
  end
  return nums 
end
     
def player_stats(name)
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :players
        for i in (0...value.length)
          if value[i][:name] == name
            value[i].delete(:name)
            return value[i]
          end
        end
      end
    end
  end
end
      
def big_shoe_rebounds
  allplayers = []
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :players
        allplayers << value
      end
    end 
  end
  allplayers.flatten!
  sortedplayers = allplayers.sort_by {|player| player[:shoe]}
  return sortedplayers.last[:rebounds]
end

def most_points_scored
  allplayers = []
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :players
        allplayers << value
      end
    end
  end
  allplayers.flatten!
  sortedplayers = allplayers.sort_by {|player| player[:points]}
  return sortedplayers.last[:name]
end

def winning_team
  new_hash = game_hash
  new_hash.each do |homeness, teamdata|
  total = 0  
    teamdata.each do |attribute, value|
      if attribute == :players
        for i in (0...value.length)
          total += value[i][:points]
        end
      end
    end
  teamdata[:total] = total
  end
  sortedteams = new_hash.sort_by {|key, value| value[:total]}
  sortedteams.last.last[:team_name]
end
        
def player_with_longest_name
  allplayers = []
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :players
        allplayers << value
      end
    end 
  end
  allplayers.flatten!
  sortedplayers = allplayers.sort_by {|player| player[:name].length}
  return sortedplayers.last[:name]
end  

def long_name_steals_a_ton?
  allplayers = []
  game_hash.each do |homeness, teamdata|
    teamdata.each do |attribute, value|
      if attribute == :players
        allplayers << value
      end
    end
  end
  allplayers.flatten!
  sortedplayers = allplayers.sort_by {|player| player[:steals]}
  return sortedplayers.last[:name] == player_with_longest_name
end
      