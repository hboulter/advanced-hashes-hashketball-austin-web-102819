require "pry"

def game_hash
  team_data = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => [ "Black", "White" ],
    :players => [
      { player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
      { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
      { player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
      { player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
      { player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 },
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => [ "Turquoise", "Purple" ],
    :players => [
      { player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
      { player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
      { player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
      { player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
      { player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 },
    ]
  }
}
end

def num_points_scored(player_name)
  game_hash.each { |location, team_data|
    team_data.each { |attributes, values|
      if attributes == :players
        values.each { |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        }
      end
    }
  }
end

def shoe_size(player_name)
  game_hash.each { |location, team_data|
    team_data.each { |attributes, values|
      if attributes == :players
        values.each { |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        }
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each { |location, team_data|
      if team_data[:team_name] == team_name
        return team_data[:colors]
      end
    }
end

def team_names
  array = []
  array.push(game_hash[:home][:team_name])
  array.push(game_hash[:away][:team_name])
  array
end

def player_numbers(team_name)
  array = []
  game_hash.each { |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each { |attributes, values|
        if attributes == :players
          values.each { |player|
          array << player[:number]
          }
        end
      }
    end
  }
  array
end

def player_stats(player_name)
  array = []
  game_hash.each {|location, team_data|
    team_data.each {|attributes, values|
      if attributes == :players
        values.each {|player|
          if player[:player_name] == player_name
            array = player.reject! {|n| n == :player_name}
          end
        }
      end
    }
  }
  array
end

def big_shoe_rebounds
  big_foot = 0
  rebounds = 0
    game_hash.each {|location, team_data|
      team_data[:players].each {|player|
        if player[:shoe] > big_foot
          big_foot = player[:shoe]
          rebounds = player[:rebounds]
        end
      }
    }
    rebounds
end

def most_points_scored
  scored = 0
  max_scorer = 0
    game_hash.each {|location, team_data|
      team_data[:players].each {|player|
        if player[:points] > scored
          scored = player[:points]
          max_scorer = player[:player_name]
        end
      }
    }
    max_scorer
end

def winning_team
  home = 0
  away = 0
    game_hash[:home][:players].each {|location|
      home += location[:points]
    }
    game_hash[:away][:players].each {|location|
      away += location[:points]
    }
    if home > away
      game_hash[:home][:team_name]
    elsif home < away
      game_hash[:away][:team_name]
    else
      "It's a tie!"
    end
end

def player_with_longest_name
  longest_name = 0
  player_name = 0
  game_hash.each {|location, team_data|
    team_data[:players].each {|player|
      if player[:player_name].length > longest_name
        longest_name = player[:player_name].length
        player_name = player[:player_name]
      end
     }
    }
    player_name
end

def long_name_steals_a_ton?
  most_steals = 0
  player_with_most_steals = 0
  game_hash.each {|location, team_data|
    team_data[:players].each {|player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
        player_with_most_steals = player[:player_name]
      end
    }
  }
  if player_with_longest_name && player_with_most_steals
    true
  else
    false
  end
end
